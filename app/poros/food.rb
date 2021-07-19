class Food
  attr_reader :code, :description, :brand, :ingredients

  def initialize(info)
    @code = info[:gtinUpc]
    @description = info[:description]
    @brand = info[:brandOwner]
    @ingredients = info[:ingredients]
  end
end
