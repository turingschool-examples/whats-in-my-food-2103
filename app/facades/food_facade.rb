class FoodFacade
  def self.search_results(search)
    json = FDCService.search_foods(search)
    json[:foods].map do |json_food|
      Food.new(json_food)
    end
  end
end