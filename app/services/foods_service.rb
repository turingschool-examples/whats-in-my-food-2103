class FoodsService

  def self.foods_search(ingredient)
    response = Faraday.get("https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['API_KEY']}&query=#{ingredient}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
