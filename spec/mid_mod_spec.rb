require 'rails_helper'

RSpec.describe 'as a user' do
  it 'I can search foods' do
    # be a user
    visit root_path
    fill_in :search, with: "sweet potatoes"
    click "Search"
    expect(current_path).to eq("/foods")
    # it 'and see the total numbers of search results' do
    #   expect(page).to have_content("Total Results: ")
    # end
    # it 'and see 10 foods containing my search term' do
    #   # within
    #   #   count == 10
    #   # end
    # end
    # it 'for each food I should see details' do
    #   # withing the first result
    #   expect(page).to have_content("GTIN/UPC Code: ")
    #   expect(page).to have_content("Description: ")
    #   expect(page).to have_content("Brand Owner: ")
    #   expect(page).to have_content("Ingredients: ")
    # end
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
