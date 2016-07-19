require 'checkout_view'

describe CheckoutView do
  subject(:checkout_view) { described_class.new(basket:[product_001, product_001], total_price:9.25) }
  let(:product_001) { instance_spy "product_001", price:9.25, product_code: :"001" }

  it "Print checkout" do
    expect(checkout_view._print).to eq "Basket: 001,001\nTotal price expected: £9.25\n"
  end
end
