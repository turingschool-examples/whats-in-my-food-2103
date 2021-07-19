require 'rails_helper'

RSpec.describe FoodsService do
  context "class methods" do
    context "#foods_by_ingredient" do
      it "returns food data", :vcr do
        search = FoodsService.foods_search("Sweet Potatoes")
        expect(search).to be_a Hash
        expect(search[:foods]).to be_an Array
        food_data = search[:foods].first

        expect(food_data).to have_key :gtinUpc
        expect(food_data[:gtinUpc]).to be_a(String)

        expect(food_data).to have_key :description
        expect(food_data[:description]).to be_a(String)

        expect(food_data).to have_key :brandOwner
        expect(food_data[:brandOwner]).to be_a(String)

        expect(food_data).to have_key :ingredients
        expect(food_data[:ingredients]).to be_a(String)
      end
    end
  end
end
