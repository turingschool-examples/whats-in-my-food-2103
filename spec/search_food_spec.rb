require 'rails_helper'

RSpec.describe 'Food Search' do
  describe 'happy path' do
    it 'allows users to search for food' do
      visit root_path

      fill_in :q,	with: 'sweet potatoes'

      click_button 'Search'

      expect(current_path).to eq(foods_path)

      expect(page).to have_content('Total Results:')
      expect(page).to have_selector('li', count: 40)
      expect(page).to have_content('GTIN/UPC code')
      expect(page).to have_content('Description')
      expect(page).to have_content('Brand Owner')
      expect(page).to have_content('Ingredients')
    end
  end
end
