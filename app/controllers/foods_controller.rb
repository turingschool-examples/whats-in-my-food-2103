class FoodsController < ApplicationController
  def search
    @found_food = FoodsFacade.find_food_by_name(params[:search])
  end

  # def search_state
  #   state = params[:state]
  #   conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
  #     faraday.headers["X-API-KEY"] = ENV['PROPUBLICA_API_KEY']
  #   end
  #
  #   response = conn.get("/congress/v1/members/house/#{state}/current.json")
  #
  #   json = JSON.parse(response.body, symbolize_names: true)
  #
  #   @house_members = json[:results]
  # end
  #
  # def search_state_refactor
  #   # state = params[:state]
  #
  #   json = CongressService.house_members_by_state(params[:state])

    # conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV['PROPUBLICA_API_KEY']
    # end
    #
    # response = conn.get("/congress/v1/members/house/#{state}/current.json")
    #
    # json = JSON.parse(response.body, symbolize_names: true)

    # @house_members = json[:results]

    # @house_members = json[:results].map do |house_member_data|
    #   HouseMember.new(house_member_data)
    # end

    # @house_members = CongressFacade.find_all_house_members_by_state(params[:state])

  end
end
