class FoodFacade

  def self.search(query)
    food_data = FdcService.search(query)
    total_result_count = food_data[:totalHits]

    foods = food_data[:foods].map do |food|
      Food.new(food)
    end

    {total_hits: total_result_count, top_ten: foods}
  end
end
