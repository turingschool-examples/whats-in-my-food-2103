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

      expect(results).to be_a Hash
      
      expect(results).to have_key :total_result_count
      expect(results[:total_result_count]).to eq 45635

      expect(results).to have_key :top_ten_results
      expect(results[:top_ten_results]).to be_an Array

      expect(results[:top_ten_results].first).to be_a Food
      expect(results[:top_ten_results].first.description).to eq 'SWEET POTATOES'
      expect(results[:top_ten_results].first.brand).to eq "ARCHER FARMS"
      expect(results[:top_ten_results].first.ingredients).to eq "SWEET POTATOES."
      expect(results[:top_ten_results].first.upc_code).to eq "492111402857"
    end
  end
end
