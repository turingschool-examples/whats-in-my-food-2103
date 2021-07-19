class FoodFacade
  def self.search(search_term)
    response = FoodService.search_foods(search_term)
    response[:foods].map do |result|
      FoodPoro.new(result)
    end
  end
end
