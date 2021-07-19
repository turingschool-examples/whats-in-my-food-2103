require 'rails_helper'

RSpec.describe Food do
  before :each do
    json = File.read('./spec/fixtures/sweet_potato_search.json')
    foods = JSON.parse(json, symbolize_names: true)
    food_details = foods[:foods].first
    @food = Food.new(food_details)  
  end

  it 'has relevant food details' do
    expect(@food).to be_a Food
    expect(@food.description).to eq "SWEET POTATOES"
    expect(@food.brand).to eq "ARCHER FARMS"
    expect(@food.ingredients).to eq "SWEET POTATOES."
    expect(@food.upc_code).to eq "492111402857"
  end
end
