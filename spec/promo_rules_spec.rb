require 'promo_rules'

describe PromoRules do
  let(:product_001) { double :product, price:9.25, product_code:001}
  let(:product_002) { double :other_station, price:45.00, product_code:002 }
  subject(:promo_rules) { described_class.new() }
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

    it "change price of lavender hearts if 2+ lavender hearts" do
      basket = [product_001, product_001, product_002]
      allow(product_001).to receive(:price=)
      allow(product_001).to receive(:price).and_return(8.50)
      expect(promo_rules.change_price_001(basket)).to eq [product_001, product_001, product_002]
      expect(product_001.price).to eq 8.50
    end

    it "less than 2 lavender hearts return basket" do
      basket = [product_001, product_002]
      allow(product_001).to receive(:price=)
      expect(promo_rules.change_price_001(basket)).to eq [product_001, product_002]
      expect(product_001.price).to eq 9.25
    end
  end

  context "Promo Rules over £60" do
    it "over £60 return true" do
      basket = [product_002, product_002]
      expect(promo_rules.over60?(basket)).to eq true
    end

    it "over £60 return false" do
      basket = [product_002]
      expect(promo_rules.over60?(basket)).to eq false
    end

    it "ten percent off" do
      basket = [product_002]
      expect(promo_rules.ten_percent_off_total(basket)).to eq 40.5
    end

    it "calculates new total price if over £60" do
      basket = [product_002, product_002]
      expect(promo_rules.calculate_promo_60(basket)).to eq 81
    end

    it "returns normal total price if less then £60" do
      basket = [product_002]
      expect(promo_rules.calculate_promo_60(basket)).to eq 45
    end
  end

end
