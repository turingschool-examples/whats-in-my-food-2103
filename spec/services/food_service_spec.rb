require 'rails_helper'

RSpec.describe 'class methods' do
  describe '::get_food_data' do
    it 'returns food data from USDA site' do
      response = FoodService.get_food_data('sweet potatoes')

      expect(response).to be_a Hash
      expect(response[:foods]).to be_an Array
      expect(response[:foods].first).to be_a Hash

      first_food_data = response[:foods].first

      expect(first_food_data).to have_key :gtinUpc
      expect(first_food_data[:gtinUpc]).to be_a String

      expect(first_food_data).to have_key :description
      expect(first_food_data[:description]).to be_a String

      expect(first_food_data).to have_key :brandOwner
      expect(first_food_data[:brandOwner]).to be_a String

      expect(first_food_data).to have_key :ingredients
      expect(first_food_data[:ingredients]).to be_a String
    end
  end
end
