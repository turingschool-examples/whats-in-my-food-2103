require 'rails_helper'

RSpec.describe FoodService do
  it 'can search for a food' do
    expect(FoodService.food_search("sweet potatoes").class).to eq(Hash)
    expect(FoodService.food_search("sweet potatoes")[:totalHits]).to eq(45635)
    expect(FoodService.food_search("sweet potatoes")[:foods].count).to eq(50)
  end

end
