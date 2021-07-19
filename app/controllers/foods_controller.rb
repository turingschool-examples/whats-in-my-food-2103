class FoodsController < ApplicationController
  def show
    @foods = FoodsFacade.foods(params[:q])
    @results = FoodsFacade.results_number(params[:q])
    #require "pry"; binding.pry
  end
end
