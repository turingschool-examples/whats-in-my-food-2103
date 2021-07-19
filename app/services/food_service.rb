class FoodService
  def self.search_foods_by_ingredient(ingredient)
    response = conn.get("/search?query=#{ingredient}")
    response_json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.nal.usda.gov/fdc/v1/foods') do |faraday|
      faraday.params['api_key'] = ENV['FOODS_API_KEY']
    end
  end

  private_class_method :conn
end
