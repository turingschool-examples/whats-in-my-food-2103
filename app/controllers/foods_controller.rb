class FoodsController < ApplicationController
  def search
    @foods = FoodFacade.food_search(params[:search])
  end
end