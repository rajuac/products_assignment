require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#price' do
    it 'returns a float' do
      expect(Product.new(price_in_cents: 1234).price).to eq(12.34)
    end
  end

  describe '#get_price' do
    it 'returns a numeric' do
      expect(Product.first.get_price("EUR")).is_a? Numeric
    end
  end

  describe '#show_price' do
    it 'returns a numeric' do
      expect(Product.first.get_price("EUR")).is_a? Numeric
    end
  end
  
end
