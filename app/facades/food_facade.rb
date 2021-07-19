class FoodFacade
  def self.search(query)
    json = FoodDataService.search(query)
    json[:foods].map { |food| Food.new(food) }
  end
end