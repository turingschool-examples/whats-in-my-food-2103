require 'rails_helper'

RSpec.describe FoodService do
  it 'can search for a food' do
    expect(FoodService.food_search("sweet potatoes").class).to eq(Hash)
    require "pry";binding.pry
  end
end
