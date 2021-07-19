module Endpoints
  def api_endpoint
    'https://api.nal.usda.gov/fdc/v1/'.freeze
  end

  def find_foods_endpoint
    '/foods/search'.freeze
  end
end
