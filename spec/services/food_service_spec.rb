require 'rails_helper'

RSpec.describe 'Food Services' do
    it 'can reach out to server with API key and return results' do
        response = FoodService.ingredient_search("sweet potatoes")
        expect(response).to be_a Hash
        expect(response[:foods]).to be_an Array
    end
end