require 'rails_helper'

describe FoodService do
  describe "class methods" do
    describe "#get_search_food" do
      it "returns food data" do
        stub_get_food_info

        response = FoodService.call_for_food("sweet potato")

        expect(response).to be_a(Hash)
      end
    end
  end
end
