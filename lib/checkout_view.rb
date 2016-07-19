class CheckoutView
  BASKET= "Basket: "
  TOTAL_PRICE= "Total price expected: £"
  NEW_LINE= "\n"
  COMMA= ","

  def initialize(basket:, total_price:)
    @basket = basket
    @total_price = total_price
  end

  def _print
    basket_line + total_price_line
  end

  private

  def basket_line
    BASKET + format_basket + NEW_LINE
  end

  def total_price_line
    TOTAL_PRICE + format_total + NEW_LINE
  end

  def format_basket
    @basket.map(&:product_code).join(COMMA)
  end

  def format_total
    sprintf('%.2f', @total_price)
  end
end
