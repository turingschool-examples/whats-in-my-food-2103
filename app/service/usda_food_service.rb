class UsdaFoodService
  def self.search(q)
    query_params = {query: q, api_key: ENV['USDA_FOOD_DATA_KEY']}
    res = Faraday.get('https://api.nal.usda.gov/fdc/v1/foods/search', query_params)
    Foods.new(JSON.parse(res.body))
  end
end