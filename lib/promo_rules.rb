class PromoRules
  PROMO_1 = 60
  PROMO_2 = 2

	def two_plus_001?(array)
		array.count{|product| product_001?(product)} >= PROMO_2
	end

  def over60?(array)
    array.inject(0){|sum,product| sum + product.price } > PROMO_1
  end

  private

  def product_001?(product)
    product.product_code == 001
  end

end
