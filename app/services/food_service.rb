class FoodService

  def self.search(search)
    response = connection.get('fdc/v1/foods/search') do |faraday|
      faraday.params[:query] = search
    end
    parse_data(response)
    # binding.pry
  end



  def self.connection
    Faraday.new(
      url: 'https://api.nal.usda.gov/',
      params: {
        'api_key' => ENV["food_api"]
      }
    )
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
