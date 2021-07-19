class FoodService
  class << self

    def food_search(search_params)
      response = conn.get("/fdc/v1/foods/search?query=#{search_params}")
      parsed_data(response)
    end

    private

    def conn
      Faraday.new(
        url: 'https://api.nal.usda.gov',
        headers: {'X-Api-Key': ENV['food_api_key']}
      )
    end

    def parsed_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
