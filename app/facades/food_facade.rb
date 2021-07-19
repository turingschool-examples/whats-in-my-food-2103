class FoodFacade
  def search(search_term)
    response = FoodService.search_foods(search_term)
    response.map do |result|
      FoodPoro.new(result)
    end
  end
end
