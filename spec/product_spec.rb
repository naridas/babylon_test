require 'product'

describe Product do
  subject(:product) { described_class.new(product_code:"001", name:"Lavenderheart", price:9.25) }

  context "when initializing" do
    it "has product_code argument 001" do
      expect(product.product_code).to eq "001"
    end

    it "has name argument Lavenderheart" do
      expect(product.name).to eq "Lavenderheart"
    end

    it "has price argument 9.25" do
      expect(product.price).to eq 9.25
    end
  end

  context "can change price after initialized" do
    it "change price from 9.25 to 8.50" do
      expect(product.price).to eq 9.25
      product.price = 8.50
      expect(product.price).to eq 8.50
    end
  end
end
