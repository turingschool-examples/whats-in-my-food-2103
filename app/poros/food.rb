class Food
  attr_reader :gtin_upc, :description, :brand_owner, :ingredients

  def initialize(food_hash)
    @gtin_upc = food_hash[:gtinUpc]
    @description = food_hash[:description]
    @brand_owner = food_hash[:brandOwner]
    @ingredients = food_hash[:ingredients]
  end
end