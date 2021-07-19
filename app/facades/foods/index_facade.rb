class Foods::IndexFacade
  def self.search_by_food(food)
    attrs = FoodsAPI::Client.search_by_food(food)
    attrs.map do |food_result|
      Poros::Food.new(food_result)
    end
  end
end
