require 'rails_helper'

describe 'FoodFacade' do
  it 'can facilitate food search' do
    response = File.read("#{Rails.root}/spec/fixtures/food_api/sweet_potato_10_results_search.json")

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['FOOD_API_KEY']}&pageSize=10&query=sweet%20potatoes").to_return(status: 200, body: response, headers: {})

    sweet_potato_search = FoodFacade.search('sweet potatoes')
    expect(sweet_potato_search).to be_an(Array)
    expect(sweet_potato_search.size).to eq(10)
    expect(sweet_potato_search.first).to be_an_instance_of(FoodPoro)
  end
end
