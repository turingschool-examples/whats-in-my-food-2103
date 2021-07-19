class FoodsController < ApplicationController
    def index
        @foods = FoodFacade.search_foods(params[:q])
        @results = FoodFacade.total_results(params[:q]) 
    end
end