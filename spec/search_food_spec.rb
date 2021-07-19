require 'rails_helper'

RSpec.describe 'Food Search' do
  describe 'happy path' do
    it 'allows users to search for food' do
      visit root_path

      fill_in :q,	with: 'sweet potatoes'

      click_button 'Search'

      expect(current_path).to eq(foods_path)

      expect(page).to have_content('Total Results:')
      expect(page).to have_selector('input', count: 10)
      expect(page).to have_content('GTIN/UPC code')
      expect(page).to have_content('description')
      expect(page).to have_content('Brand Owner')
      expect(page).to have_content('ingredients')
    end
  end
end

# As a visitor,
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