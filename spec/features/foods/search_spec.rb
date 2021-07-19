require 'rails_helper'

RSpec.describe 'Search for foods' do
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

  it 'Can search for a food' do

    visit root_path

    fill_in :search, with: 'sweet potatoes'
    click_button 'Search'

    expect(page.status_code).to eq 200
    expect(page).to have_content('GTIN/UPC code')
    expect(page).to have_content('description')
    expect(page).to have_content('Brand Owner')
    expect(page).to have_content('ingredient')

    
    response_body = File.read('spec/fixtures/senators.json')

    stub_request(:get, "https://api.propublica.org/congress/v1/117/senate/members.json").
         to_return(status: 200, body: response_body, headers: {})

    visit root_path

    fill_in :search, with: 'Boozman'
    click_button 'Search'

    expect(page.status_code).to eq 200
    expect(page).to have_content('Senator John Boozman')
    expect(page).to have_content("Twitter Handle: JohnBoozman")
  end
end
