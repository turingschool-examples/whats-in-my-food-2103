class FoodService
  def food_search(food)
    response = conn.get('/fdc/v1/foods/search') do |find|
      find.params['query'] = "ingredients:#{food}"
      find.params['pageSize'] = 10
    end
    parse_json(response)
  end

  private
    def self.conn
    Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["api_key"] = ENV['food_key']
    end

    def self.parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
