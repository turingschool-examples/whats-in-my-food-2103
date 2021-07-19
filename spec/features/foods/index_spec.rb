require 'rails_helper'

RSpec.describe 'Food Index Page' do
  it 'returns list of foods when searched for' do
    visit root_path

    fill_in :q, with: "sweet potatoes"
    click_button 'Search'

    expect(current_path).to eq(foods_path)
    expect(page.all('li', count: 10))

    expect(page).to have_content("UPC code: 492111402857")
    expect(page).to have_content("Description: SWEET POTATOES")
    expect(page).to have_content("Brand owner: ARCHER FARMS")
    expect(page).to have_content("Ingredients: SWEET POTATOES.")
  end
end
