class FoodsController < ApplicationController
  def index
    params[:q].present?
      @search_results = FoodFacade.search_by_ingredient(params[:q])
    @search_term = params[:q]
  end
end
