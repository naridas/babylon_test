require_relative "promo_rules"
require_relative "checkout_view"

class Checkout

  attr_reader :total_price, :basket

  def initialize(promo_rules:nil, checkout_view:nil)
    @promo_rules = promo_rules || PromoRules.new
    @checkout_view = checkout_view || CheckoutView
    @basket = []
    @total_price = ""
  end

  def scan(product)
    basket << product
  end

  def total
    @basket = @promo_rules.change_price(@basket)
    @total_price = @promo_rules.calculate_total_price(@basket)
  end

  def print_checkout
    puts @checkout_view.new(basket:basket, total_price:total_price).view
  end
end
