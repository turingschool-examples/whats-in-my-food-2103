require 'rails_helper'

RSpec.describe 'Food Facade' do
    it 'can return an array of foods from the search' do
        facade = FoodFacade.search_foods("sweet potatoes")
        expect(facade).to be_an Array
        expect(facade.first).to be_a Food
    end
end