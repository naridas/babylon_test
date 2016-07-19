class Calculate

  def discount_price(basket:, spend_over:, discount:)
    return percent_off_total(basket, discount).round(2) if over?(basket, spend_over)
    basket_sum(basket).round(2)
  end

  def over?(basket, spend_over)
    basket_sum(basket) > spend_over
  end

  def percent_off_total(basket, discount)
    basket_sum(basket) * (1 - discount)
  end

  def basket_sum(basket)
    basket.inject(0){ |sum,product| sum + product.price }
  end
end
