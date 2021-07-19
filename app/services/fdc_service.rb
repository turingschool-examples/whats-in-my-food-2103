class FDCService
  def self.search_foods
    url =
    response = Faraday.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end
end