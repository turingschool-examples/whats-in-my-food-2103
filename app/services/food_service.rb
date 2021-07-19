class FoodService
    def self.ingredient_search(ingredient)
      response = conn.get("/fdc/v1/foods/search?query=#{ingredient}")
      parse_json(response)
    end
  
    private
  
    def self.conn
      Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
        faraday.headers["X-API-KEY"] = ENV['food_data_key']
      end
    end
  
    def self.parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end