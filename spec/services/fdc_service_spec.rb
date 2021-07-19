require 'rails_helper'

RSpec.describe 'FDC API Service' do
  before :each do
    query = "chamomile"
    response_body = File.read('spec/fixtures/food_search.json')
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=#{query}&pageSize=10&api_key=#{ENV['FDC_API_KEY']}")
      .to_return(status: 200, body: response_body, headers: {})

    @search_result = FdcService.search(query)
  end

  it 'returns 10 results with key details and also lists total results' do
    expect(@search_result).to have_key(:totalHits)
    expect(@search_result[:foods].length).to eq(10)
    expect(@search_result[:foods].first).to have_key(:gtinUpc)
    expect(@search_result[:foods].first).to have_key(:description)
    expect(@search_result[:foods].first).to have_key(:brandOwner)
    expect(@search_result[:foods].first).to have_key(:ingredients)
  end
end
