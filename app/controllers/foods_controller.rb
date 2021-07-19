class FoodsController < ApplicationController
  def index
    @queried_food = params[:q]
    @count_total_results = FoodFacade.total_hits(params[:q])
    @found_foods = FoodFacade.search_food(params[:q])[0..9]
  end
end
