class FoodFacade
  class << self
    def food_search(search_params)
      results = FoodService.food_search(search_params)[:foods]
      food = results.map do |info|
        Food.new(info)
      end
      food[0..9]
    end

    def total_hits(search_params)
      FoodService.food_search(search_params)[:totalHits]
    end
  end
end
