require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new(promo_rules:promo_rules) }
  let(:promo_rules) { instance_double "promo_rules" }
  let(:product_001) { instance_spy "product_001", price:9.25, product_code: :"001" }

  it "scan item and put into basket" do
    checkout.scan(product_001)
    expect(checkout.basket).to eq [product_001]
  end

  it "Get total price" do
    checkout.scan(product_001)
    allow(promo_rules).to receive(:bundle_price).and_return([product_001])
    allow(promo_rules).to receive(:discount_price).and_return(9.25)
    expect(checkout.total).to eq 9.25
  end

  it "Put out checkout view" do
    allow(STDOUT).to receive(:puts).with("Basket: \nTotal price expected: £0.00\n")
    checkout.print_checkout
  end
end
