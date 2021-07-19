class FoodFacade
  def self.search_food(foods)
    json = FoodService.get_food_data(foods)
    json[:foods].map do |food|
      Food.new(food)
    end
  end

  def self.total_hits(foods)
    json = FoodService.get_food_data(foods)
    json[:totalHits]
  end
end
