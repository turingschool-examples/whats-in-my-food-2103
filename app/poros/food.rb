class Food
  attr_reader :code, :description, :brand_owner, :ingredients
  def initialize(food_info)
      @code = food_info[:code]
      @description = food_info[:description]
      @brand_owner = food_info[:brand_owner]
      @ingredients = food_info[:ingredients]
  end
end
