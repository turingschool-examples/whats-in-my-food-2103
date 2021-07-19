class FoodFacade
  def self.search_results
    json = FDCService.search_foods
    json.map do |json_food|
      Food.new(json_food)
    end
  end
end