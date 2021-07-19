
module Helpers
  module APIHelpers
    def test_headers
      {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v1.5.0'
      }
    end

    def build_url(endpoint)
      "#{FoodApi::Client::api_endpoint}#{endpoint}?api_key=#{ENV['FOOD_API_KEY']}"
    end

    def get_fixture(file_name)
      File.open(File.dirname(__FILE__) + '/fixture_data/' + file_name, 'rb').read
    end
  end
end
