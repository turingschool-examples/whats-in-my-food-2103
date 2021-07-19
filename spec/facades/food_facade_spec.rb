require 'rails_helper'

RSpec.describe FoodFacade do
  it 'creates food objects' do
    VCR.use_cassette('fooddata_facade', :record => :new_episodes) do
      foods = FoodFacade.search('apple')

      expect(foods).is_a? Array
      foods.each do |food|
        expect(food).is_a? Food
        expect(food.code).is_a? String
        expect(food.brand).is_a? String
        expect(food.description).is_a? String
        expect(food.ingredients).is_a? String
        # expect(food.code).not_to eq nil
        # expect(food.brand).not_to eq nil
        # expect(food.description).not_to eq nil
        # expect(food.ingredients).not_to eq nil
      end
    end
  end
end