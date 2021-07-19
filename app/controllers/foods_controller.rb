class FoodsController < ApplicationController
  def index
    @foods = FoodFacade.food_search(params[:q])
    @hits = FoodFacade.total_hits(params[:q])
  end
end
