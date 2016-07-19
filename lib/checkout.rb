require_relative "promo_rules"
require_relative "checkout_view"
require_relative "calculate"

class Checkout
  attr_reader :total_price, :basket

  def initialize(promo_rules:nil, checkout_view:nil, calculate:nil)
    @promo_rules = promo_rules || PromoRules.new
    @checkout_view = checkout_view || CheckoutView
    @calculate = calculate || Calculate.new
    @basket = []
    @total_price = 0
  end

  def scan(product)
    basket << product
  end

  def total
    @basket = @promo_rules.bundle_price(@basket)
    @total_price = @calculate.discount_price(basket:@basket)
  end

  def print_checkout
    puts @checkout_view.new(basket:basket, total_price:total_price)._print
  end
end
