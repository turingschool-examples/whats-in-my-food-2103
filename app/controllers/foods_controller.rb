class FoodsController < ApplicationController
  def index
    @search_results = FoodFacade.search(params[:q])
    @total_results = FoodFacade.total_results(params[:q])
  end
end
