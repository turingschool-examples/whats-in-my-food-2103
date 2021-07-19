class FoodPoro
  attr_reader :upc, :description, :brand, :ingredients

  def initialize(info)
    @upc = info[:foods][:gtinUpc]
    @description = info[:foods][:description]
    @brand = info[:foods][:brandOwner]
    @ingredients = info[:foods][:ingredients]
  end
end
