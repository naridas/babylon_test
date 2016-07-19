class PromoRules
  BUNDLE_ITEMS = 2
  BUNDLE_PRODUCT_CODE = :"001"
  NEW_PRICE = 8.50

  def initialize(bundle_items:BUNDLE_ITEMS, product_code:BUNDLE_PRODUCT_CODE, new_price:NEW_PRICE)
    @bundle_items = bundle_items
    @product_code = product_code
    @new_price = new_price
  end

  def bundle_price(basket)
    return change_price_001(basket) if two_plus_001?(basket)
    basket
  end

	def two_plus_001?(basket)
		basket.count{ |product| product_001?(product) } >= @bundle_items
	end

  def change_price_001(basket)
    basket.map do |product|
      product.price = @new_price if product_001?(product)
      product
    end
  end

  private

  def product_001?(product)
    product.product_code == @product_code
  end
end
