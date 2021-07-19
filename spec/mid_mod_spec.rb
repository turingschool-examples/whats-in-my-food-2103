require 'rails_helper'

RSpec.describe 'as a user' do
  it 'I can search foods' do
    visit root_path
    fill_in :q, with: "sweet potatoes"
    click_button "Search"
    expect(current_path).to eq("/foods")

    it 'and see the total numbers of search results' do
      expect(page).to have_content("Total Results: ")
    end
    it 'and see 10 foods containing my search term' do
      expect(page).to have_css('single-result', count: 10)
    end
    it 'for each food I should see details' do
      within(".single_result", match: :first) do
        expect(page).to have_content("GTIN/UPC Code: ")
        expect(page).to have_content("Description: ")
        expect(page).to have_content("Brand Owner: ")
        expect(page).to have_content("Ingredients: ")
      end
    end
  end
end
