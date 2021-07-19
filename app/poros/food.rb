class Food
  attr_reader :code, :description, :brandowner, :ingredients

  def initialize(details)
    @code = details[:gtinUpc]
    @description = details[:description]
    @brandowner = details[:brandOwner]
    @ingredients = details[:ingredients]
  end
end
