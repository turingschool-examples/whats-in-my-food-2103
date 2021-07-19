class FoodService
  def self.search(query)
    response = Faraday.get "https://api.nal.usda.gov/fdc/v1/foods/search?query=#{query}&pageSize=2&api_key=#{ENV['FOOD_API_KEY']}"
    parse(response)
  end

  def private_class_method.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
