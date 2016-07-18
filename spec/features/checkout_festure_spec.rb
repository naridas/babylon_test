require "checkout"
require "product"

describe "Checkout feature tests", feature: true do

  subject(:checkout) { Checkout.new }
  let(:product_001) { Product.new(name:"Lavender heart", price:9.25, product_code:"001") }
  let(:product_002) { Product.new(name:"Personalised cufflinks", price:45.00, product_code:"002") }
  let(:product_003) { Product.new(name:"Kids T­-shirt", price:19.95, product_code:"003") }

  context "Acceptance Tests" do
    it "total price of 001,003,001" do
      checkout.scan(product_001)
      checkout.scan(product_003)
      checkout.scan(product_001)
      checkout.total
      allow(STDOUT).to receive(:puts).with("Basket: 001,003,001\nTotal price expected: £36.95\n")
      checkout.print_checkout
    end

    it "total price of 001,002,003" do
      checkout.scan(product_001)
      checkout.scan(product_002)
      checkout.scan(product_003)
      checkout.total
      allow(STDOUT).to receive(:puts).with("Basket: 001,002,003\nTotal price expected: £66.78\n")
      checkout.print_checkout
    end

    it "total price of 001,002,001,003" do
      checkout.scan(product_001)
      checkout.scan(product_002)
      checkout.scan(product_001)
      checkout.scan(product_003)
      checkout.total
      allow(STDOUT).to receive(:puts).with("Basket: 001,002,001,003\nTotal price expected: £73.76\n")
      checkout.print_checkout
      # expect(checkout.print_checkout).to eq "£73.76"
    end
  end
end
