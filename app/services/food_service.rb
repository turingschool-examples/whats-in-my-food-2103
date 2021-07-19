class FoodService
  def self.search_foods(term)
    response = conn.get("/fdc/v1/foods/search?query=#{term}&pageSize=10")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.params['api_key'] = ENV['FOOD_API_KEY']
    end
  end

  private_class_method :conn
end
