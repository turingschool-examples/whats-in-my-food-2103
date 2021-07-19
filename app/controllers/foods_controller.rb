class FoodsController < ApplicationController
  def show
    @foods = FoodsFacade.foods(params[:search])
    @results = FoodsFacade.results_number(params[:search])
  end
end
