class PromoRules
  PROMO_DISCOUNT = 60
  DISCOUNT_OFF = 0.9
  PROMO_BUNDLE_ITEMS = 2
  PROMO_BUNDLE_PRODUCT_CODE = :"001"
  PROMO_BUNDLE_NEW_PRICE = 8.50

  def bundle_price(basket)
    return change_price_001(basket) if two_plus_001?(basket)
    basket
  end

  def discount_price(basket) #discount
    return ten_percent_off_total(basket).round(2) if over60?(basket)
    basket_sum(basket).round(2)
  end

	def two_plus_001?(basket)
		basket.count{ |product| product_001?(product) } >= PROMO_BUNDLE_ITEMS
	end

  def change_price_001(basket)
    basket.map do |product|
      product.price = PROMO_BUNDLE_NEW_PRICE if product_001?(product)
      product
    end
  end

  def over60?(basket)
    basket_sum(basket) > PROMO_DISCOUNT
  end

  def ten_percent_off_total(basket)
    basket_sum(basket) * DISCOUNT_OFF
  end

  private

  def basket_sum(basket)
    basket.inject(0){ |sum,product| sum + product.price }
  end

  def product_001?(product)
    product.product_code == PROMO_BUNDLE_PRODUCT_CODE
  end
end
