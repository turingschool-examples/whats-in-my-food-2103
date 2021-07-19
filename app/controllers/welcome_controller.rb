class WelcomeController < ApplicationController
  def index
  end

  def search
    @foods = FoodFacade.search(params[:search])
  end
end
