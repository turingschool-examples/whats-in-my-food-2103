class FoodFacade
  def self.search_food(foods)
    json = FoodService.get_food_data(foods)
    json[:foods].map do |food|
      Food.new(food)
    end
  end
end
