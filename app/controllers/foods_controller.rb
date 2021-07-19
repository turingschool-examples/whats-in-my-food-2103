class FoodsController < ApplicationController
  def index
    @foods = FdcFacade.get_search_results(params[:q])[0..9]
  end
end
