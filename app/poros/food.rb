class Food
  attr_reader :description, :brand, :ingredients, :upc_code
  
  def initialize(food_details)
    @description = food_details[:description]
    @brand = food_details[:brandOwner]
    @ingredients = food_details[:ingredients]
    @upc_code = food_details[:gtinUpc]
  end
end
