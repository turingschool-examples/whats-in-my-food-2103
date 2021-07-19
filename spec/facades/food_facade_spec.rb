require 'rails_helper'

RSpec.describe 'FoodFacade' do
  it 'returns a list(array) of 10 foods that contain specified ingredient' do
    facade = FoodFacade.food_search('sweet potatoes')
    expect(facade).to be_an(Array)
    expect(facade.count).to eq(10)
  end

  it 'returns the total hits' do
    facade = FoodFacade.total_hits('sweet potatoes')
    expect(facade).to be_an(Integer)
    expect(facade).to eq(45635)
  end
end
