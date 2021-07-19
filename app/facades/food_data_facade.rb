class FoodDataFacade

  def self.foods(query)
    food_details = FoodDataService.search_foods(query)[:foods][0..9]
 
    food_details.map do |food|
      FoodDataDetails.new(food)
    end
  end
end