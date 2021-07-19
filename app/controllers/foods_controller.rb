class FoodsController < ApplicationController
  def index
    @total_amount_found = FoodFacade.total_items_returned(params[:q])
    @searched_for_food = FoodFacade.details(params[:q])
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  #private
  #def _params
    #params.permit(:)
  #end
end
