class FoodService
  def self.get_food_data(search_food)
    response = Faraday.get("https://api.nal.usda.gov/fdc/v1/foods/search") do |req|
      req.params['api_key'] = ENV['food_api']
      req.params[:query] = search_food
    end

    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
