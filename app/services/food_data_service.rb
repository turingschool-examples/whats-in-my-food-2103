class FoodDataService
  def self.search(query)
    url = 'https://api.nal.usda.gov/fdc/v1/foods/search'
    res = Faraday.get(url, { api_key: ENV['FOOD_API_KEY'], query: query })
    JSON.parse(res.body, symbolize_names: true )
  end
end