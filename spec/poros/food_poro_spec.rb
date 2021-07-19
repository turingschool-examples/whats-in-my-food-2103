require 'rails_helper'

RSpec.describe Food do
  describe 'initialize' do
    it 'creates a food item' do
      actual = Food.new({
        gtin_upc: '123456',
        description: 'num',
        brand_owner: 'me',
        ingredients: 'toes'
      })

      expect(actual.gtin_upc).to eq('123456')
      expect(actual.description).to eq('num')
      expect(actual.brand_owner).to eq('me')
      expect(actual.ingredients).to eq('toes')
    end
  end
end