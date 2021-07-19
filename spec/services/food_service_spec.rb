require 'rails_helper'


RSpec.describe 'Food API Service' do
  it 'can find food by user input' do
    query = 'sweet potato'
    response_body = File.read('spec/fixtures/sweet_potato_search.json')
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=#{query}&pageSize=2&api_key=#{ENV['FOOD_API_KEY']}").
    to_return(status: 200, body: response_body, headers: {})

    sweetsearch = FoodService.search(query)
    expect(sweetsearch.first).to eq([:totalHits, 45635])
  end
end
