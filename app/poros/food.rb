class Food
  attr_reader :description, :brand, :gtinUpc, :ingredients

  def initialize (info)
    @description = info[:description]
    @brand = info[:brand]
    @gtinUpc = info[:gtinUpc]
    @ingredients = info[:ingredients]

  end

end
