class FoodFacade
  def self.ingredient_search(search_terms)
    food_results = FoodService.food_search(search_terms)
    food_array = food_results[:foods].map do |food|
      Food.new(food)
    end
    [food_results[:totalHits], food_array[0..9]]
  end
end