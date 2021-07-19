class FdcFacade
  def self.get_search_results(food)
    json = FdcAPI.food_search(food)

    food_objects = json[:foods].map do |food|
      Food.new(food)
    end
  end
end
