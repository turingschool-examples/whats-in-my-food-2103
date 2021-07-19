require 'rails_helper'

RSpec.describe FoodDataDetails do
  it 'exists and has attributes' do
    food_details ={
      gtinUpc: "20042431",
      description: "SWEET POTATO", 
      ingredients: "SWEET POTATO, CHIPOTLE CHICKEN {COOKED CHICKEN (CHICKEN BREAST WITH RIB MEAT, CHICKEN BROTH, CONTAINS LESS THAN 2% OF: MODIFIED POTATO STARCH, GARLIC POWDER, CANOLA OIL, SOYBEAN OIL, SALT, SODIUM PHOSPHATE, CHICKEN FAT, FLAVOR), CHIPOTLE MANGO SAUCE [MANGO CHIPOTLE MARINADE (MANGO PUREE, WATER, CHIPOTLE PEPPER, ONION, SALT, BROWN SUGAR, CANOLA OIL, VINEGAR, GARLIC, LEMON JUICE CONCENTRATE, TOMATO PASTE, SPICES, RICE WINE VINEGAR, SUGAR, CILANTRO, CITRIC ACID)], WATER, CILANTRO}, MANGO SALSA (MANGO, CUCUMBER, TOMATO, LIME JUICE, MANGO PUREE, ONION, CILANTRO, SERRANO PEPPERS, SALT).",
      brandOwner: "FRESH & EASY"
    }
    sweet_potato = FoodDataDetails.new(food_details)

    expect(sweet_potato).to be_a(FoodDataDetails)
    expect(sweet_potato.code).to eq(food_details[:gtinUpc])
    expect(sweet_potato.description).to eq(food_details[:description])
    expect(sweet_potato.ingredients).to eq(food_details[:ingredients])
    expect(sweet_potato.owner).to eq(food_details[:brandOwner])
  end
end