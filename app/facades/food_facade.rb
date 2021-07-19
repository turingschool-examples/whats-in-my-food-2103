class FoodFacade
  def self.total_items_returned(food)
    FoodService.food_search(food)[:totalHits]
  end

  def self.details(food)
    FoodService.food_search(food)[:foods].map do |food_data|
      SearchedFood.new(food_data)
    end
  end
end
