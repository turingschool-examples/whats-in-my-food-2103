require_relative 'endpoints'

module ApiCalls
  extend Endpoints

  def search_by_food(food)
    response = get find_foods_endpoint, params: {
      query: food
    }
    response[:results]
  end

end
