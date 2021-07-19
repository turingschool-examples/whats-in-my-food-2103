class FoodsController < ApplicationController
  def index
    @foods = Foods::IndexFacade.search_by_food(params[:id])
  end
end
