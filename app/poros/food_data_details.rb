class FoodDataDetails
  attr_reader :code, 
              :description, 
              :owner,
              :ingredients

  def initialize(food_details)
    @code = food_details[:gtinUpc]
    @description = food_details[:description]
    @owner = food_details[:brandOwner]
    @ingredients = food_details[:ingredients]
  end
end