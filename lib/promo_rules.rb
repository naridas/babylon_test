class PromoRules
  PROMO_DISCOUNT = 60
  DISCOUNT_OFF = 0.1
  PROMO_BUNDLE_ITEMS = 2
  PROMO_BUNDLE_PRODUCT_CODE = :"001"
  PROMO_BUNDLE_NEW_PRICE = 8.50

  def bundle_price(basket)
    return change_price_001(basket) if two_plus_001?(basket)
    basket
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

  private

  def product_001?(product)
    product.product_code == PROMO_BUNDLE_PRODUCT_CODE
  end
end
