class FoodsController < ApplicationController
  def index
    @queried_food = params[:q]
    @count_total_results = FoodFacade.search_food(params[:q]).size
    @found_foods = FoodFacade.search_food(params[:q])[0..9]
  end
end
