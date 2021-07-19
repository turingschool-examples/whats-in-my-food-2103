require 'rails_helper'

RSpec.describe FoodDataService do
  describe 'search' do
    it 'searches' do
      VCR.use_cassette('fooddata_search', :record => :new_episodes) do
        body = FoodDataService.search('apple')
        search_array = body[:foods]

        expect(body).is_a? hash
        expect(search_array).is_a? Array
      end
    end
  end
end