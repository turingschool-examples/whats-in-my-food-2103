require 'rails_helper'

RSpec.describe 'FDC API' do
  it 'returns food data that matches the search query' do
    response_body = File.open('spec/fixtures/sweet_potatoes.json')

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['api_key']}&pageSize=10&query=sweet potatoes").
      to_return(status: 200, body: response_body, headers: {})

    response = FdcAPIService.food_search('sweet potatoes')

    expect(response[:foods].first[:gtinUpc]).to eq('492111402857')
    expect(response[:foods].first[:description]).to eq('SWEET POTATOES')
    expect(response[:foods].first[:brandOwner]).to eq('ARCHER FARMS')
    expect(response[:foods].first[:ingredients]).to eq('SWEET POTATOES.')
    expect(response[:foods].count).to eq(10)
  end
end
