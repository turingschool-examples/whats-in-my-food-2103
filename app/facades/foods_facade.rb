class FoodsFacade
  def self.foods(ingredient)
    foods = FoodsService.foods_search(ingredient)
    foods[:foods].map do |food|
      Food.new(ingredient)
    end[0..9]
  end

  def self.results_number(ingredient)
    foods = FoodsService.foods_search(ingredient)
    foods[:totalHits]
  end
end
