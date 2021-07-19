class FoodsController < ApplicationController

  def search_results
    results = FoodFacade.search(params[:q])
    @total_hits = results[:total_hits]
    @top_ten_foods = results[:top_ten]
  end
end
