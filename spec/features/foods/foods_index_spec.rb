require 'rails_helper'

RSpec.describe 'Foods index' do
  describe 'search for foods with ingredient' do
    it 'returns a list of foods (+ details) containing the ingredient' do
      visit root_path

      response_body = File.read('./spec/fixtures/sweet_potato_search.json')
      stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=sweet potatoes&pageSize=10&api_key=#{ENV['api_key']}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.5.1'
           }).
         to_return(status: 200, body: response_body, headers: {})

      fill_in :q, with: 'sweet potatoes'
      click_on 'Search'

      expect(current_path).to eq '/foods'
      expect(page).to have_content "SWEET POTATOES"
      expect(page).to have_content "Ingredients: SWEET POTATOES."
      expect(page).to have_content "Brand: ARCHER FARMS"
      expect(page).to have_content "UPC Code: 492111402857"
    end

    it 'displays the total number of search results' do
      visit root_path

      response_body = File.read('./spec/fixtures/sweet_potato_search.json')
      stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=sweet potatoes&pageSize=10&api_key=#{ENV['api_key']}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.5.1'
           }).
         to_return(status: 200, body: response_body, headers: {})

      fill_in :q, with: 'sweet potatoes'
      click_on 'Search'

      expect(page).to have_content("Total results: 45635")
    end
  end
end

