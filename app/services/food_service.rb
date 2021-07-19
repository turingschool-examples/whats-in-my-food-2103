class FoodService
  def self.foods_by_ingredient(ingredient)
    search = "sweet potatoes"
    response = Faraday.get("https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['FOOD_DB_KEY']}&query=#{search}&pageSize=10")

    JSON.parse(response.body, symbolize_names: true)
  end
end
