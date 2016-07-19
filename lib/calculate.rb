class Calculate
  SPEND_OVER = 60
  DISCOUNT_OFF = 0.1

  def initialize(spend_over:SPEND_OVER, discount_off:DISCOUNT_OFF)
    @spend_over = spend_over
    @discount_off = discount_off
  end

  def discount_price(basket:, spend_over:@spend_over, discount_off:@discount_off)
    return percent_off_total(basket, discount_off).round(2) if over?(basket, spend_over)
    basket_sum(basket).round(2)
  end

  def over?(basket, spend_over)
    basket_sum(basket) > spend_over
  end

  def percent_off_total(basket, discount_off)
    basket_sum(basket) * (1 - discount_off)
  end

  def basket_sum(basket)
    basket.inject(0){ |sum,product| sum + product.price }
  end
end
