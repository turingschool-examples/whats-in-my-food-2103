class FoodsController < ApplicationController
  def index
    params[:q].present?
      @search_results = "food results"
  end
end
