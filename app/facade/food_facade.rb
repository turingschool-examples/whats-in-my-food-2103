class FoodFacade
  def self.ingredient_search
    json = 
    json.map do |movie|
      Movie.new(movie)
    end
  end
end