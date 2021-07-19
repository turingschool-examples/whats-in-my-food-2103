class FoodDataService

  def self.search_foods(query)
    conn = Faraday.new(url: "https://api.nal.usda.gov") do |f|
      f.params["api_key"] = ENV["FOOD_KEY"]
    end

    response = conn.get("/fdc/v1/foods/search?query=#{query}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end