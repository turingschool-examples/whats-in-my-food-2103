class FoodsController < ApplicationController
  def index
    @foods = FoodFacade.search_results
  end
end