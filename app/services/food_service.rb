class FoodService
  def self.food_search(food_name)
    url = "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['FOOD_API_KEY']}&query=#{food_namename}"
    response = Faraday.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end
end