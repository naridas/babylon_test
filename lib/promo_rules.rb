class PromoRules
  PROMO_60 = 60
  PROMO_001 = 2
  TEN_PERCENT_OFF = 0.9

  def change_price(basket)
    return change_price_001(basket) if two_plus_001?(basket)
    basket
  end

  def calculate_total_price(basket)
    return ten_percent_off_total(basket).round(2) if over60?(basket)
    basket_sum(basket).round(2)
  end

	def two_plus_001?(basket)
		basket.count{|product| product_001?(product)} >= PROMO_001
	end

  def change_price_001(basket)
    basket.map do |product|
      product.price = 8.50 if product_001?(product)
      product
    end
  end

  def over60?(basket)
    basket_sum(basket) > PROMO_60
  end

  def ten_percent_off_total(basket)
    basket_sum(basket) * TEN_PERCENT_OFF
  end

  private

  def basket_sum(basket)
    basket.inject(0){|sum,product| sum + product.price }
  end

  def product_001?(product)
    product.product_code == 001
  end
end
