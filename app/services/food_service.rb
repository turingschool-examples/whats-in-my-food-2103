class FoodService
    def self.get_senate_members
      response = conn.get("/fdc/v1/foods")
            req.headers['api_key'] = ENV['food_key']
        end

      parse_json(response)

    end


    def self.conn
    Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/foods") do |faraday|
      faraday.headers["api_key"] = ENV['food_key']
    end

    def self.parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    private_class_method :conn  #:parse_json
end
