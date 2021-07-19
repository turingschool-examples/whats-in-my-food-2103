class WelcomeController < ApplicationController
  def index
  end

  def foods
    @q = params[:q]
    res = Faraday.get('https://api.nal.usda.gov/fdc/v1/foods/search', {query: @q, api_key: ENV['USDA_FOOD_DATA_KEY']})
    body = JSON.parse(res.body)
    @total_hits = body['totalHits']
    @foods = []
    body['foods'].each do |f|
      @foods << { 
        gtin_upc: f['gtinUpc'],
        brand_owner: f['brandOwner'],
        description: f['description'],
        ingredients: f['ingredients']
      }
    end
  end
end
