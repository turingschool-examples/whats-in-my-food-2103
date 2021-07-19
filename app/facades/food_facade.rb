class FoodFacade
  def self.ingredient_search(ingredient)
    search_results = FoodService.search_by_ingredient(ingredient)
    foods = search_results[:foods]
    foods.map do |result|
      Food.new(result)
    end
  end
end
