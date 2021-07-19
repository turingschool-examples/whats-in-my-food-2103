require 'rails_helper'

RSpec.describe FoodPoro do
  it 'instantiates with expected attributes' do
    response = File.read("#{Rails.root}/spec/fixtures/food_api/sweet_potato_10_results_search.json")
    single_search_result = JSON.parse(response, symbolize_names: true)[:foods].first
    food_poro = FoodPoro.new(single_search_result)
    expect(food_poro.code).to eq("20042431")
    expect(food_poro.description).to eq("SWEET POTATO")
    expect(food_poro.brand_owner).to eq("FRESH & EASY")
    expect(food_poro.ingredients).to eq("SWEET POTATO, CHIPOTLE CHICKEN {COOKED CHICKEN (CHICKEN BREAST WITH RIB MEAT, CHICKEN BROTH, CONTAINS LESS THAN 2% OF: MODIFIED POTATO STARCH, GARLIC POWDER, CANOLA OIL, SOYBEAN OIL, SALT, SODIUM PHOSPHATE, CHICKEN FAT, FLAVOR), CHIPOTLE MANGO SAUCE [MANGO CHIPOTLE MARINADE (MANGO PUREE, WATER, CHIPOTLE PEPPER, ONION, SALT, BROWN SUGAR, CANOLA OIL, VINEGAR, GARLIC, LEMON JUICE CONCENTRATE, TOMATO PASTE, SPICES, RICE WINE VINEGAR, SUGAR, CILANTRO, CITRIC ACID)], WATER, CILANTRO}, MANGO SALSA (MANGO, CUCUMBER, TOMATO, LIME JUICE, MANGO PUREE, ONION, CILANTRO, SERRANO PEPPERS, SALT).")
  end
end
