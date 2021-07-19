class EndpointStitch
  def self.stitch(endpoint)
    "#{FoodsAPI::Client::api_endpoint}#{endpoint}?api_key=#{ENV['API_KEY']}"
  end
end
