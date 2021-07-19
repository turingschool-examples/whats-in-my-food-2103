require 'rails_helper'

RSpec.describe 'food search' do
  it 'can return the total number of foods that contain the search' do
    visit '/'

    fill_in :q, with: "sweet potatoes"
    click_on "Search"

    expect(current_path).to eq('/foods')
    expect(page).to have_content("Number of Results: 10000 +")
    expect(page).to have_content("GTIN/UPC: 492111402857")
    expect(page).to have_content("Description: SWEET POTATOES")
    expect(page).to have_content("Brand Owner: ARCHER FARMS")
    expect(page).to have_content("Ingredients: SWEET POTATOES.")
  end
end