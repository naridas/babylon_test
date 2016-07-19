class Product

  attr_reader :name, :product_code
  attr_accessor :price

  def initialize(product_code:, name:, price:)
    @product_code = product_code
    @name = name
    @price = price
  end
end
