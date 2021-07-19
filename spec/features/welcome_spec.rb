require 'rails_helper'

RSpec.describe 'The welcome page' do
  describe 'search form' do
    it 'navigates the user to the /food page' do
      food_details_mock_path = build_url(FoodApi::ApiEndpoints.search_foods_endpoint) << '&query=sweet%20potatoes'
      food_details_mock_data = get_fixture('sweet_potatoes.json')
      stub_request(:get, food_details_mock_path)
        .with(headers: test_headers).to_return(status: 200, body: food_details_mock_data, headers: {})
        
      visit '/'

      within 'form' do
        fill_in 'q', with: 'sweet potatoes'
        click_button 'Search'
      end

      expect(current_path).to eq foods_path
    end
  end
end