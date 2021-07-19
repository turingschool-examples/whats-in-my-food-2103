require 'rails_helper'

RSpec.describe 'as a user' do
  it 'I can search foods' do
    response = File.read("#{Rails.root}/spec/fixtures/food_api/sweet_potato_10_results_search.json")
    parsed_response = JSON.parse(response, symbolize_names: true)[:foods].first

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['FOOD_API_KEY']}&pageSize=10&query=sweet%20potatoes").to_return(status: 200, body: response, headers: {})

    visit root_path

    fill_in :q, with: "sweet potatoes"
    click_button "Search"
    expect(current_path).to eq("/foods")

    # and see the total numbers of search results
    expect(page).to have_content("Total Results: 45635")

    #and see 10 foods containing my search term
    expect(page).to have_css('.single-result', count: 10)

    #for each food I should see details
    # within(".single_result", match: :first) do
    expect(page).to have_content("GTIN/UPC: 20042431")
    expect(page).to have_content("Description: SWEET POTATO")
    expect(page).to have_content("Brand Owner: FRESH & EASY")
    expect(page).to have_content("Ingredients: SWEET POTATO, CHIPOTLE CHICKEN {COOKED CHICKEN (CHICKEN BREAST WITH RIB MEAT, CHICKEN BROTH, CONTAINS LESS THAN 2% OF: MODIFIED POTATO STARCH, GARLIC POWDER, CANOLA OIL, SOYBEAN OIL, SALT, SODIUM PHOSPHATE, CHICKEN FAT, FLAVOR), CHIPOTLE MANGO SAUCE [MANGO CHIPOTLE MARINADE (MANGO PUREE, WATER, CHIPOTLE PEPPER, ONION, SALT, BROWN SUGAR, CANOLA OIL, VINEGAR, GARLIC, LEMON JUICE CONCENTRATE, TOMATO PASTE, SPICES, RICE WINE VINEGAR, SUGAR, CILANTRO, CITRIC ACID)], WATER, CILANTRO}, MANGO SALSA (MANGO, CUCUMBER, TOMATO, LIME JUICE, MANGO PUREE, ONION, CILANTRO, SERRANO PEPPERS, SALT).")
    # end
  end
end
