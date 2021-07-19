class FoodService
  def self.food_search(food)
    response = conn.get("search?api_key=#{ENV['X-Api-Key']}&query=#{food}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/foods/")
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn
end
