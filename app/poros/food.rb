class Food
  attr_reader :code, :description, :brand, :ingredients

  def initialize(info)
    binding.pry
    @code = info[:gtinUpc]
    binding.pry
    @description = info[:description]
    @brand = info[:brandOwner]
    binding.pry
    @ingredients = info[:ingredients]
    binding.pry
  end
end
