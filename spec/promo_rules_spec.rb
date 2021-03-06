require 'promo_rules'
require 'product'

describe PromoRules do
  let(:product_001) { instance_spy "product_001", price:9.25, product_code: :"001" }
  let(:product_002) { instance_spy "product_002", price:45.00, product_code: :"002" }
  subject(:promo_rules) { described_class.new }
  context "Promo Rules 2+ lavender hearts" do
    it "2+ lavender hearts return true" do
      basket = [product_001, product_001]
      expect(promo_rules.two_plus_001?(basket)).to eq true
    end

    it "less than 2 lavender hearts return false" do
      basket = [product_002, product_001]
      expect(promo_rules.two_plus_001?(basket)).to eq false
    end

    it "change price of lavender hearts" do
      basket = [product_001]
      allow(product_001).to receive(:price=)
      allow(product_001).to receive(:price).and_return(8.50)
      expect(promo_rules.change_price_001(basket)).to eq [product_001]
      expect(product_001.price).to eq 8.50
    end

    it "bundle price of lavender hearts if 2+ lavender hearts" do
      basket = [product_001, product_001, product_002]
      allow(product_001).to receive(:price=)
      allow(product_001).to receive(:price).and_return(8.50)
      expect(promo_rules.bundle_price(basket)).to eq [product_001, product_001, product_002]
      expect(product_001.price).to eq 8.50
    end

    it "less than 2 lavender hearts return basket" do
      basket = [product_001, product_002]
      allow(product_001).to receive(:price=)
      expect(promo_rules.bundle_price(basket)).to eq [product_001, product_002]
      expect(product_001.price).to eq 9.25
    end
  end
end
