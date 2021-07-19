require "rails_helper"

RSpec.describe "Food Search" do
  it "Can search for foods by ingredient" do
    visit root_path
    fill_in :search, with: "sweet potatoes"
    click_on :search
    expect(current_path).to eq foods_path
    expect(page).to have_content("Foods found: 45635")
    expect(page).to have_css('.foods', count: 10)
    within(first('.parks')) do
      expect(page).to have_content("GTIN/UPC code: 20042431")
      expect(page).to have_content("Description: SWEET POTATO")
      expect(page).to have_content("Brand Owner: FRESH & EASY")
      expect(page).to have_content("Ingredients: SWEET POTATO, CHIPOTLE CHICKEN {COOKED CHICKEN (CHICKEN BREAST WITH RIB MEAT,
                                    CHICKEN BROTH, CONTAINS LESS THAN 2% OF: MODIFIED POTATO STARCH, GARLIC POWDER, CANOLA OIL,
                                    SOYBEAN OIL, SALT, SODIUM PHOSPHATE, CHICKEN FAT, FLAVOR),
                                    CHIPOTLE MANGO SAUCE [MANGO CHIPOTLE MARINADE (MANGO PUREE, WATER, CHIPOTLE PEPPER, ONION,
                                    SALT, BROWN SUGAR, CANOLA OIL, VINEGAR, GARLIC, LEMON JUICE CONCENTRATE, TOMATO PASTE,
                                    SPICES, RICE WINE VINEGAR, SUGAR,CILANTRO, CITRIC ACID)], WATER, CILANTRO},
                                    MANGO SALSA (MANGO, CUCUMBER, TOMATO, LIME JUICE, MANGO PUREE, ONION, CILANTRO, SERRANO PEPPERS, SALT).")
    end
  end
end
