require 'rails_helper'

RSpec.describe 'Food Facade' do
  describe '::search_food' do
    it 'can search for food' do

      sweet_potatoes = FoodFacade.search_food("sweet potatoes")
      second_sweet_potato = sweet_potatoes.second

      expect(sweet_potatoes).to be_an Array
      expect(second_food_potato).to be_a Food
      expect(second_sweet_potato.gtinUpc).to eq("046567926179")
      expect(second_sweet_potato.description).to eq("SWEET POTATOES")
      expect(second_sweet_potato.brandOwner).to eq("Raley's")
      expect(second_sweet_potato.ingredients).to eq("SWEET POTATOES.")
    end
  end
end
