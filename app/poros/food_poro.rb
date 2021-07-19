class FoodPoro
  attr_reader :upc, :description, :brand, :ingredients

  def initialize(info)
    @upc = info[:foods]
  end
end
