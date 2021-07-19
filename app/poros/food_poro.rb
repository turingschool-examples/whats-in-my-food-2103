class FoodPoro
  attr_reader :code, :description, :brand_owner, :ingredients

  def initialize(result_hash)
    @code = result_hash[:gtinUpc]
    @description = result_hash[:description]
    @brand_owner = result_hash[:brandOwner]
    @ingredients = result_hash[:ingredients]
  end
end
