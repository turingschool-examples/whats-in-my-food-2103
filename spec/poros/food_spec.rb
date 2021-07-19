require "rails_helper"

RSpec.describe Food do
  it "exists" do
    attributes = {
      gtinUpc: "123456789",
      description: "CHEESE",
      brandOwner: "Kraft",
      ingredients: "Cheese"
    }

    food = Food.new(attributes)

    expect(food).to be_a Food
    expect(food.gtinUpc).to eq("123456789")
    expect(food.description).to eq("CHEESE")
    expect(food.brandOwner).to eq("Kraft")
    expect(food.ingredients).to eq("Cheese")
  end
end
