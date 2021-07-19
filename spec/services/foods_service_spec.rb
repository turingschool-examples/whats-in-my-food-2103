require 'rails_helper'

RSpec.describe FoodsService do
  context "class methods" do
    context "#foods_by_ingredient" do
      it "returns food data", :vcr do
        search = FoodsService.foods_search("Cheese")
        expect(search).to be_a Hash
        expect(search[:foods]).to be_an Array
        food_data = search[:foods].first
      end
    end
  end
end
