class FDCService
  def self.search_foods(search)
    url = "https://api.nal.usda.gov/fdc/v1/foods/search?query=sweet%20potatoes&pageSize=10000&api_key=#{ENV['FDC_API_KEY']}"
    response = Faraday.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end
end