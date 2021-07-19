class SearchedFood
  attr_reader :gtinUpc, :description, :brandOwner, :ingredients

  def initialize(food_data)
    @gtinupc = food_data[:gtinUpc]
    @description = food_data[:description]
    @brandowner = food_data[:brandOwner]
    @ingredients = food_data[:ingredients]
  end
end
