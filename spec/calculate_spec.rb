require 'calculate'

describe Calculate do
  let(:product_001) { instance_spy "product_001", price:9.25, product_code: :"001" }
  subject(:calculate) { described_class.new }
	before(:each) {@basket = [product_001, product_001]}

  it "over £10 return true" do
    expect(calculate.over?(@basket, 10)).to eq true
  end

  it "less than £20 return false" do
    expect(calculate.over?(@basket, 20)).to eq false
  end

  it "20% discount off total price" do
    expect(calculate.percent_off_total(@basket, 0.2)).to eq 14.8
  end

  it "total price of the basket" do
    expect(calculate.basket_sum(@basket)).to eq 18.5
  end

  it "discounted price of the basket with promo" do
    expect(calculate.discount_price(basket:@basket, spend_over:10, discount:0.05)).to eq 17.58
  end
end
