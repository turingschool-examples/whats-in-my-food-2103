require 'rails_helper'

RSpec.describe Food do
  it 'has atributes' do
    info = {
      fdcId: 535125,
      description: "SWEET POTATOES",
      lowercaseDescription: "sweet potatoes",
      dataType: "Branded",
      gtinUpc: "492111402857",
      publishedDate: "2019-04-01",
      brandOwner: "ARCHER FARMS",
      ingredients: "SWEET POTATOES.",
      marketCountry: "United States",
      foodCategory: "Frozen Prepared Sides",
      allHighlightFields: "<b>Ingredients</b>: <em>SWEET</em> <em>POTATOES</em>.",
      score: 939.0768
    }
    food = Food.new(info)
    expect(food).to be_an_instance_of(Food)
    expect(food.gtinupc).to eq("492111402857")
    expect(food.description).to eq("SWEET POTATOES")
    expect(food.brand_owner).to eq("ARCHER FARMS")
    expect(food.ingredients).to eq("SWEET POTATOES.")
  end
end
