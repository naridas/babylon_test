require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new(promo_rules:promo_rules, checkout_view:checkout_view) }
  let(:promo_rules) { instance_double "promo_rules" }
  let(:product_001) { instance_spy "product_001", price:9.25, product_code:"001" }
  let(:checkout_view) { class_double("CheckoutView") }

  it "scan item and put into basket" do
    checkout.scan(product_001)
    expect(checkout.basket).to eq [product_001]
  end

  it "Get total price" do
    checkout.scan(product_001)
    allow(promo_rules).to receive(:change_price).and_return([product_001])
    allow(promo_rules).to receive(:calculate_total_price).and_return(9.25)
    expect(checkout.total).to eq 9.25
  end

  it "Put out checkout view" do
    allow(checkout_view).to receive(:new).with(basket:[], total_price:0).and_return(checkout_view)
    # allow(checkout_view).to receive(:view).and_return("checkout_view")
    checkout.print_checkout
    output = spy(:output)
    expect(output).to have_received(:puts).with("checkout_view")
  end
end
