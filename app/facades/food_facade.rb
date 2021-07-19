class FoodFacade
  def self.total_items_returned(food)
    FoodService.food_search(food)[:totalHits]
  end
end
