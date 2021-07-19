class FoodsController < ApplicationController
  def index
    results = FoodFacade.ingredient_search(params[:q])
    @result_count = results[:total_result_count]
    @foods = results[:top_ten_results]
  end
end
