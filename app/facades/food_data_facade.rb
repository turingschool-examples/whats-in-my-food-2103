class FoodDataFacade

  def self.foods(query)
    food_details = FoodDataService.search_foods(query)[:foods][0..9]
 
    food_details.map do |food|
      FoodDataDetails.new(food)
    end
  end

  def self.total_results(query)
    FoodDataService.search_foods(query)[:totalHits]
  end
end