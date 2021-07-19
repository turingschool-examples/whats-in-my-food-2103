require 'rails_helper'

RSpec.describe FoodsAPI::Client do
  describe 'API Call' do

    describe '::search_by_name' do
      it 'returns the search results for foods' do
        binding.pry
        search_mock_path = EndpointStitch::stitch(FoodsAPI::Client::find_foods_endpoint) << 'Sweet%20Potatoes'
        search_mock_data = FoodsAPIMock::get('search_food_result.json')
        stub_request(:get, search_mock_path)
          .with(headers: test_headers).to_return(status: 200, body: search_mock_data, headers: {})

        foods = FoodsAPI::Client.search_by_food('Sweet Potatoes')

        expect(foods).to be_an Array
        expect(foods.first[:gtinUpc]).to eq '492111402857'
        expect(foods.first[:brandOwner]).to eq 'ARCHER FARMS'
      end
    end
  end
end
