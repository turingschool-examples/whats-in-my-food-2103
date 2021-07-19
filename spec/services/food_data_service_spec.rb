require 'rails_helper'

RSpec.describe FoodDataService do
  describe 'search' do
    it 'searches' do
      VCR.use_cassette('fooddata_search', :record => :new_episodes) do
        body = FoodDataService.search('apple')
        search_array = body[:foods]

        expect(body).is_a? Hash
        expect(search_array).is_a? Array
        expect(search_array.first).to have_key(:gtinUpc)
        expect(search_array.first).to have_key(:description)
        expect(search_array.first).to have_key(:ingredients)
        expect(search_array.first).to have_key(:brandOwner)
      end
    end
  end
end