class FdcFacade
  def self.get_search_results(food)
    json = FdcAPI.food_search(food)
    total_results = json[:totalHits]

    food_objects = json[:foods].map do |food|
      Food.new(food, total_results)
    end
  end
end
