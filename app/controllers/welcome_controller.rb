class WelcomeController < ApplicationController
  def index
  end

  def foods
    @q = params[:q]
    @foods = UsdaFoodService.search(@q)
  end
end
