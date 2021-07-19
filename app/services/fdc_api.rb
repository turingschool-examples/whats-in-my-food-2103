class FdcAPI
  def self.food_search(food)
    response = Faraday.get("https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['api_key']}&query=#{food}")

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
