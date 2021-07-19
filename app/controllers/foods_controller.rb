class FoodsController < ApplicationController
  def index
    @foods = FdcFacade.get_search_results(params[:q])
    binding.pry
  end
end
