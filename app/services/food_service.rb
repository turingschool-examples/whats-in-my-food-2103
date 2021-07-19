class FoodService

  def self.food_search(search_terms)
    food_api = ENV["food_api"]
    response = Faraday.get("https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{food_api}&query=#{search_terms}")
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

end