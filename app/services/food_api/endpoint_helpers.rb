module EndpointHelpers
  def api_endpoint
    # The http API endpoint for this service
    'https://api.nal.usda.gov/fdc/'.freeze
  end

  # API Endpoint Helpers

  def search_foods_endpoint
    "v1/foods/search".freeze
  end
end
