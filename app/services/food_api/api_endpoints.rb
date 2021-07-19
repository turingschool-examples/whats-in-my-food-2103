Dir[Rails.root.join('app/services/food_api/api_calls/*.rb')].each { |api_call| require api_call }

class FoodApi::ApiEndpoints < FoodApi::Client
  # API call modules
  extend SearchFoods
end