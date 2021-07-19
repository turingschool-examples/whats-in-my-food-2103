require 'rails_helper'

RSpec.describe "Foods Index Page" do
  context "user submits 'sweet potato' as query in serach form" do
    it 'returns 10 foods items according to search query' do
      visit root_path 
      fill_in :q, with: "sweet potato"
      click_on "Search"

      expect(current_path).to eq(foods_path)
      expect(page).to have_content("45635 Total Results")
      expect(page).to have_selector('li', count: 10)
      within(first('.food')) do
        expect(page).to have_content("20042431")
        expect(page).to have_content("SWEET POTATO")
        expect(page).to have_content("SWEET POTATO, CHIPOTLE CHICKEN {COOKED CHICKEN (CHICKEN BREAST WITH RIB MEAT, CHICKEN BROTH, CONTAINS LESS THAN 2% OF: MODIFIED POTATO STARCH, GARLIC POWDER, CANOLA OIL, SOYBEAN OIL, SALT, SODIUM PHOSPHATE, CHICKEN FAT, FLAVOR), CHIPOTLE MANGO SAUCE [MANGO CHIPOTLE MARINADE (MANGO PUREE, WATER, CHIPOTLE PEPPER, ONION, SALT, BROWN SUGAR, CANOLA OIL, VINEGAR, GARLIC, LEMON JUICE CONCENTRATE, TOMATO PASTE, SPICES, RICE WINE VINEGAR, SUGAR, CILANTRO, CITRIC ACID)], WATER, CILANTRO}, MANGO SALSA (MANGO, CUCUMBER, TOMATO, LIME JUICE, MANGO PUREE, ONION, CILANTRO, SERRANO PEPPERS, SALT).")
        expect(page).to have_content("FRESH & EASY")
      end
    end
  end
end