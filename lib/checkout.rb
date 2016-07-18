require_relative "promo_rules"

class Checkout

  attr_reader :total_price, :basket

  def initialize(promo_rules = nil)
    @promo_rules = promo_rules || PromoRules.new
    @basket = []
    @total_price = 0
  end

  def scan(product)
    @basket << product
  end

  def total
    @basket = @promo_rules.change_price(@basket)
    @total_price = @promo_rules.calculate_total_price(@basket)
  end
end
