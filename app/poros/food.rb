class Food
  attr_reader :upc,
              :description,
              :brand_owner,
              :ingredients,
              :total_results

  def initialize(json, total_results)
    @upc = json[:gtinUpc]
    @description = json[:description]
    @brand_owner = json[:brandOwner]
    @ingredients = json[:ingredients]
    @total_results = total_results
  end
end
