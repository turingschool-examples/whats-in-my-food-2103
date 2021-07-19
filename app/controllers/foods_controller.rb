class FoodsController < ApplicationController
  def index
    @foods = FoodApi::ApiEndpoints.search_foods(params[:q])
  end
end
