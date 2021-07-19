require 'rails_helper'

RSpec.describe 'Foods page' do
  it 'displays searched for foods' do
    VCR.use_cassette('food_search_view', :record => :new_episodes) do
      visit '/'
      fill_in 'q', with: 'sweet potatoes'
      click_button 'Search'

      expect(current_path).to eq '/foods'
    end
  end

  it 'displays number of items returned by search' do
    VCR.use_cassette('food_search_view', :record => :new_episodes) do
      visit '/'
      fill_in 'q', with: 'sweet potatoes'
      click_button 'Search'

      expect(current_path).to eq '/foods'
      expect(page).to have_content('You searched for sweet potatoes, with 45635 results')
      expect(page).to have_content('Your Results')
    end
  end

  it 'only displays 10' do
    VCR.use_cassette('food_search_view', :record => :new_episodes) do
      visit '/'
      fill_in 'q', with: 'sweet potatoes'
      click_button 'Search'

      expect(current_path).to eq '/foods'
    end
  end



end