require 'rails_helper'

RSpec.describe 'Food Facade' do
  it '.search returns total count and details of top 10 search results from query' do
    query = "chickpeas"
    response_body = File.read('spec/fixtures/food_search.json')
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=#{query}&pageSize=10&api_key=#{ENV['FDC_API_KEY']}")
      .to_return(status: 200, body: response_body, headers: {})

    search_results = FoodFacade.search(query)

    expect(search_results[:total_hits]).to eq(2075)
    expect(search_results[:top_ten].length).to eq(10)
    expect(search_results[:top_ten].first.gtin_upc).to eq("741643032903")
    expect(search_results[:top_ten].first.description).to eq("CHICKPEAS")
    expect(search_results[:top_ten].first.brand_owner).to eq("Lowe's Food Stores, Inc.")
    expect(search_results[:top_ten].first.ingredients).to eq("PREPARED GARBANZO BEANS, WATER, SALT, CALCIUM CHLORIDE TO HELP MAINTAIN FIRMNESS, CALCIUM DISODIUM EDTA ADDED TO HELP PROMOTE COLOR RETENTION.")
  end
end
