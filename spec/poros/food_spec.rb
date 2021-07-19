require 'rails_helper'

RSpec.describe 'Food PORO' do
  it 'has readable attributes' do
    attributes = {gtinUpc: "741643032903",
                   description: "CHICKPEAS",
                   brandOwner: "LOWES FOODS",
                   ingredients: "CHICKPEAS (GARBANZO BEANS)"}

    food = Food.new(attributes)

    expect(food.gtin_upc).to eq(attributes[:gtinUpc])
    expect(food.description).to eq(attributes[:description])
    expect(food.brand_owner).to eq(attributes[:brandOwner])
    expect(food.ingredients).to eq(attributes[:ingredients])
  end
end
