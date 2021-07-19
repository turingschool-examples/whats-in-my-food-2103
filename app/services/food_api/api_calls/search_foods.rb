module SearchFoods
  def search_foods(query)
    response = request :get, search_foods_endpoint, params: {
      query: query
    }
    response[:foods]
  end
end
