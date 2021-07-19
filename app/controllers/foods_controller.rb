class FoodsController < ApplicationController
  def index
    @foods = FoodFacade.search_results(params["q"])
    require 'pry'; binding.pry
  end
end