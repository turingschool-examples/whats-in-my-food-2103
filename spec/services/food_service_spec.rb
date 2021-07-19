require 'rails_helper'

RSpec.describe FoodService do
  it 'can search food api' do
    search_term = "sweet potato"
    response = File.read("#{Rails.root}/spec/fixtures/food_api/sweet_potato_10_results_search.json")

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=sweet potato&pageSize=10&api_key=#{ENV['FOOD_API_KEY']}").to_return(status: 200, body: response, headers: {})

    service_response = FoodService.search_foods(search_term)

    expect(service_response).to be_an(Hash)
    expect(service_response).to have_key(:totalHits)
    expect(service_response[:foods].size).to eq(10)
    expect(service_response[:foods]).to be_an(Array)
    expect(service_response[:foods].first).to be_a(Hash)
    expect(service_response[:foods].first).to have_key(:description)
    expect(service_response[:foods].first).to have_key(:gtinUpc)
    expect(service_response[:foods].first).to have_key(:brandOwner)
    expect(service_response[:foods].first).to have_key(:ingredients)
  end
end
