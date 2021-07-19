class FoodsController < ApplicationController

  def index
    @foods = FoodFacade.ingredient_search(params[:q])
  end
end