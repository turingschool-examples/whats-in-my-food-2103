require 'rails_helper'

RSpec.describe 'Food Object' do
    it 'can read the Food object attributes' do
        food = FoodFacade.search_foods("sweet potatoes")
        first_food_item = food.first

        expect(first_food_item.brand_owner).to eq("ARCHER FARMS")
        expect(first_food_item.code).to eq("492111402857")
        expect(first_food_item.description).to eq("SWEET POTATOES")
        expect(first_food_item.ingredients).to eq("SWEET POTATOES.")
    end
end