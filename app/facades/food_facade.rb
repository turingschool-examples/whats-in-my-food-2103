class FoodFacade
  def self.ingredient_search(ingredient)
    search_results = FoodService.search_by_ingredient(ingredient)
    {
      total_result_count: search_results[:totalHits],
      top_ten_results: search_results[:foods].map { |result| Food.new(result) }
    }
  end
end
