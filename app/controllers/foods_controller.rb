class FoodsController < ApplicationController
  def index
    @query = params[:q]
    @foods = FoodDataFacade.foods(@query)
    @total = FoodDataFacade.total_results(@query)
  end
end