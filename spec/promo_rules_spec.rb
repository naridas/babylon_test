require 'promo_rules'

describe PromoRules do
  let(:product_001) { double :product, price:9.25, product_code:001}
  let(:product_002) { double :other_station, price:45.00, product_code:002 }
  subject(:promo_rules) { described_class.new() }
  context "If you have 2+ lavender hearts" do
    it "2+ lavender hearts return true" do
      array = [product_001, product_001]
      expect(promo_rules.two_plus_001?(array)).to eq true
    end
  end

  context "If you have price greater than 60 " do
    it "over £60 return true" do
      array = [product_002, product_002]
      expect(promo_rules.over60?(array)).to eq true
    end
  end

end
