class FoodsController < ApplicationController
  def index
    @found_foods = FoodService.food_search(params[:q])
  end


end
