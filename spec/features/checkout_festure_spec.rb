require "checkout"
require "product"

describe "Checkout feature tests", feature: true do

  subject(:checkout) { Checkout.new }
  let(:product_001) { Product.new(name:"Lavender heart", price:9.25, product_code:001) }
  let(:product_002) { Product.new(name:"Personalised cufflinks", price:45.00, product_code:002) }
  let(:product_003) { Product.new(name:"Kids T­-shirt", price:19.95, product_code:003) }
  context "Getting total price" do
    it "total price of 001,003,001" do
      checkout.scan(product_001)
      checkout.scan(product_001)
      checkout.scan(product_003)
      expect(checkout.total).to eq 36.95
    end

    it "total price of 001,002,003" do
      checkout.scan(product_001)
      checkout.scan(product_002)
      checkout.scan(product_003)
      expect(checkout.total).to eq 66.78
    end

    it "total price of 001,002,001,003" do
      checkout.scan(product_001)
      checkout.scan(product_002)
      checkout.scan(product_001)
      checkout.scan(product_003)
      expect(checkout.total).to eq 73.76
    end
  end
end
