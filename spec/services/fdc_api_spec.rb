require 'rails_helper'

RSpec.describe 'FDC API' do
  it 'returns all foods that match the search query' do
    response_body = File.open('spec/fixtures/sweet_potatoes.json')
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=hfOXFebrbJl5BavYcEGOq2GmfcIIogi8ctDDWGI5&query=sweet_potatoes").
    to_return(status: 200, body: response_body, headers: {})

    response = FdcAPI.food_search('sweet_potatoes')
    binding.pry
    expect(response[:foods].first[:gtinUpc]).to eq('492111402857')
    expect(response[:foods].first[:description]).to eq('SWEET POTATOES')
    expect(response[:foods].first[:brandOwner]).to eq('ARCHER FARMS')
    expect(response[:foods].first[:ingredients]).to eq('SWEET POTATOES.')
  end
end
