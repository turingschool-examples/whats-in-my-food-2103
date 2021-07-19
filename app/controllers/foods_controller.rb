class FoodsController < ApplicationController
  def search
    @foods = FoodFacade.search(params[:search])
  end
end
