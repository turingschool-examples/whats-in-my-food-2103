require "rails_helper"

RSpec.describe "Food Search" do
  it "Can search for foods by ingredient" do
    visit root_path
    fill_in :q, with: "sweet potatoes"
    click_on "Search"
    expect(current_path).to eq foods_path
    expect(page).to have_content("Foods Found: 10")
    expect(page).to have_css('.foods', count: 10)
    within(first('.foods')) do
      expect(page).to have_content("GTIN/UPC code: 492111402857")
      expect(page).to have_content("Description: SWEET POTATOES")
      expect(page).to have_content("Brand Owner: ARCHER FARMS")
      expect(page).to have_content("Ingredients: SWEET POTATOES")
    end
  end
end
