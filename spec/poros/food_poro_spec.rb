require(rails_helper)

RSpec.descrbe Food do
  describe 'initialize' do
    it 'creates a food item' do
      actual = Food.new({
        gtinUpc: '123456',
        description: 'num',
        brand_owner: 'me',
        ingredients: 'toes'
      })

      expect(actual.gtinUpc).to eq('123456')
      expect(actual.description).to eq('num')
      expect(actual.brand_owner).to eq('me')
      expect(actual.ingredients).to eq('toes')
    end
  end
end