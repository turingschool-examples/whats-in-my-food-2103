require 'rails_helper'

RSpec.describe FoodFacade do
  describe '.ingredient_search' do
    it 'returns an array of foods with the searched ingredient' do
      response_body = File.read('./spec/fixtures/sweet_potato_search.json')
      stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=sweet potatoes&pageSize=10&api_key=#{ENV['api_key']}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.5.1'
           }).
         to_return(status: 200, body: response_body, headers: {})

      results = FoodFacade.ingredient_search('sweet potatoes')

      expect(response).to be_an Array
      expect(response.first).to be_a Food
      expect(response.first.description).to eq 'SWEET POTATOES'
      expect(response.first.brand).to eq "ARCHER FARMS"
      expect(response.first.ingredients).to eq "SWEET POTATOES."
      expect(response.first.upc_code).to eq "492111402857"
    end
  end
end
