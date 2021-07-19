class FoodFacade
  def self.get_food_info(food)
    produce_item_info = FoodService.call_for_produce(food)
    produce_item_info[:data].map do |data|
      Food.new(data)
    end
  end
end
