require 'rails_helper'

RSpec.describe FoodsApi::ApiEndpoints do
  describe 'search_foods' do
    it 'returns a list of 10 food results' do
      food_details_mock_path = build_url(FoodApi::ApiEndpoints.search_foods_endpoint) << '&query=sweet+potatoes'
      food_details_mock_data = get_fixture('sweet_potatoes.json')
      stub_request(:get, food_details_mock_path)
        .with(headers: test_headers).to_return(status: 200, body: food_details_mock_data, headers: {})

      response = FoodsApi::ApiEndpoints.search_foods

      expect(response.length).to eq 10
      expect(response.first[:fdcId]).to eq 535125
      expect(response.first[:description]).to eq 'SWEET POTATOES'
      expect(response.first[:brandOwner]).to eq 'ARCHER FARMS'
      expect(response.first[:foodNutrients].length).to eq 14
    end
  end
end