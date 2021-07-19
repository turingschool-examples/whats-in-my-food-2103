class FoodsController < ApplicationController
  def index
    conn = Faraday.new(
      url: 'https://api.nal.usda.gov/fdc/v1/foods/search',
      params: {
        api_key: ENV['food_data_key']
      }
    )
    response = conn.get("?query=#{params[:q]}&pageSize=10")
    @results = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end
