class FoodsController < ApplicationController
  def search
    @query = params[:q]
    @hits = FoodDataService.search(@query)[:totalHits]
    @display_foods = FoodFacade.search(params[:q])[0..9]
  end
end
