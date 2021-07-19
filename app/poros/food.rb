class Food
  attr_reader :upc,
              :description,
              :brand_owner,
              :ingredients
  def initialize(json)
    @upc = json[:gtinUpc]
    @description = json[:description]
    @brand_owner = json[:brand_owner]
    @ingredients = ingredient_list(json)
  end

  def ingredient_list(json)
    json[:ingredients].map do |ingredient|
      ingredient
    end
  end
end
