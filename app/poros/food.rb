class Food
  attr_reader :gtinUpc, :description, :brandOwner, :ingredients

  def initialize(food_info)
    @gtinUpc = food_info[:gtinUpc]
    @description = food_info[:description]
    @brandOwner = food_info[:brandOwner]
    @ingredients = food_info[:ingredients]
  end
end
