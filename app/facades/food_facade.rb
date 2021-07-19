class FoodFacade
  def self.food_search(food_name)
    json = FoodService.food_search(food_name)
    json.map do |json_food|
      Food.new(json_food)
    end
  end
end