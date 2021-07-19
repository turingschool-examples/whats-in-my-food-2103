require 'rails_helper'

RSpec.describe 'Food index page' do
  before :each do
    food_details_mock_path = build_url(FoodApi::ApiEndpoints.search_foods_endpoint) << '&query=sweet%20potatoes'
    food_details_mock_data = get_fixture('sweet_potatoes.json')
    stub_request(:get, food_details_mock_path)
      .with(headers: test_headers).to_return(status: 200, body: food_details_mock_data, headers: {})

    visit '/'
    within 'form' do
      fill_in 'q', with: 'sweet potatoes'
      click_button 'Search'
    end
  end

  describe 'list of searched foods' do
    it 'shows 10 food results from the search' do
      within '#food-list-rows' do
        expect(page).to have_selector('tr', count: 10)
      end
    end
  end

  describe 'food list,' do
    context 'each food item' do
      it 'shows the GTIN/UPC code, description, brand owner, and ingredients' do
        within '#fdcId-535125' do
          expect(page).to have_content('492111402857')
          expect(page).to have_content('SWEET POTATOES')
          expect(page).to have_content('ARCHER FARMS')
        end
        within '#ingredient-1004' do
          expect(page).to have_content('Total lipid (fat)')
          expect(page).to have_content('0.0')
          expect(page).to have_content('Calculated from a daily value percentage per serving size measure')
        end
      end
    end
  end
end