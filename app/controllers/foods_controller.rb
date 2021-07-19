class FoodsController < ApplicationController
  def index
    @foods = FoodFacade.search_results(params["q"])
    @search_result_count = @foods.count
  end
end