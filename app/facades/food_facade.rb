class FoodFacade
  def self.search_by_ingredient(ingredient)
    response = FoodService.search_foods_by_ingredient(ingredient)
    response.map do |result|
      FoodPoro.new(result)
    end
  end
end
