require 'rails_helper'

RSpec.describe Food do

  describe "food class exists with atributes" do

    it "has atributes" do

      info = {description: "orang tea",
              brand: "bigalo",
              gtinUpc: "bla bla blaa",
              ingredients: "oranges and tea leaves"
            }


      food = Food.new(info)

      expect(food).to be_a(Food)
      expect(food.description).to eq("orang tea")
      expect(food.brand).to eq("bigalo")
      expect(food.gtinUpc).to eq("bla bla blaa")
      expect(food.ingredients).to eq("oranges and tea leaves")
    end
  end
end
