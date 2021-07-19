require "rails_helper"
RSpec.describe FoodService do
  describe 'instance methods' do
    it "returns food data" do
      search = "sweet potatoes"
      search_food = FoodService.foods_by_ingredient(search)

      expect(search_food).to be_an Hash
      expect(search_food[:foods]).to be_an Array
      food_data = search_food[:foods].first

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
