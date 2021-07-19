class FoodService
  def self.call_for_food(food)
    response = conn.get("/fdc/v1/foods/search?api_key=#{ENV['PARKS_API_KEY']}&query=#{food}&Size=10&brandOwner")
    parse_json(response)
  end

private

  def self.conn
    Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['PARKS_API_KEY']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
