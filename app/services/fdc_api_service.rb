class FdcAPIService
  def self.food_search(food, limit = 10)
    response = Faraday.get("https://api.nal.usda.gov/fdc/v1/foods/search") do |req|
      req.params['api_key'] = ENV['api_key']
      req.params['query'] = food
      req.params['pageSize'] = limit
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
