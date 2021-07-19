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
      expect(page).to have_content "ARCHER FARMS"
      expect(page).to have_content "492111402857"
    end
  end
end

# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search.
# (sweet potatoes should find more than 30,000 results)
# Then I should see a list of TEN foods that contain the ingredient "sweet potatoes"
# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients

