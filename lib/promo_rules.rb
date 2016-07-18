class PromoRules
  PROMO_60 = 60
  TEN_PERCENT_OFF = 0.9
  PROMO_001_ITEMS = 2
  PROMO_001_PRODUCT_CODE = "001"
  PROMO_001_NEW_PRICE = 8.50

  def change_price(basket)
    return change_price_001(basket) if two_plus_001?(basket)
    basket
  end

  def calculate_total_price(basket)
    return ten_percent_off_total(basket).round(2) if over60?(basket)
    basket_sum(basket).round(2)
  end

	def two_plus_001?(basket)
		basket.count{|product| product_001?(product)} >= PROMO_001_ITEMS
	end

  def change_price_001(basket)
    basket.map do |product|
      product.price = PROMO_001_NEW_PRICE if product_001?(product)
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
    product.product_code == PROMO_001_PRODUCT_CODE 
  end
end
