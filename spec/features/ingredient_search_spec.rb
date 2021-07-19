require 'rails_helper'

RSpec.describe 'searching using ingredients' do
  describe '/' do
    it 'takes a search term' do
      VCR.use_cassette 'sweet_tato' do
        visit '/'

        fill_in('q', with: 'sweet potatoes')
        click_on('Search')

        expect(page).to have_current_path('/foods', ignore_query: true)
      end
    end
  end
  describe '/foods' do
    describe 'search sweet potatoes' do
      it 'displays search results' do
        VCR.use_cassette 'sweet_tato' do
          visit '/'
  
          fill_in('q', with: 'sweet potatoes')
          click_on('Search')
  
          expect(page).to have_content('Total Results: 45,635')
          expect(page).to have_content('Food:', count: 10)
          expect(page).to have_content('GTIN/UPC:', count: 10)
          expect(page).to have_content('Description:', count: 10)
          expect(page).to have_content('Brand Owner:', count: 10)
          expect(page).to have_content('Ingredients:', count: 10)
          expect(page).to have_content('ARCHER FARMS')
          expect(page).to have_content('492111402857')
          expect(page).to have_content('SWEET POTATOES')
        end
      end
    end
  end
end

# <%= number_with_delimiter(1000, :delimiter => ',') %>
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