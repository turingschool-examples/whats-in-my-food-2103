require 'rails_helper'

RSpec.describe FoodService do
  describe '.search_by_ingredient' do
    it 'returns a list of foods with the searched ingredient' do
      query = "sweet potatoes"
      response_body = File.read('./spec/fixtures/sweet_potato_search.json')
      stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=sweet potatoes&pageSize=10&api_key=#{ENV['api_key']}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.5.1'
           }).
         to_return(status: 200, body: response_body, headers: {})

      response = FoodService.search_by_ingredient(query)

      expect(response).to be_a Hash
      expect(response).to have_key :foods
      expect(response[:foods].length).to eq 10
      expect(response[:foods]).to be_an Array
      expect(response[:foods].first).to be_a Hash
      expect(response[:foods].first[:brandOwner]).to eq "ARCHER FARMS"
    end
  end
end
