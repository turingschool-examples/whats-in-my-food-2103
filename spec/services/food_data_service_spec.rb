require 'rails_helper'

RSpec.describe FoodDataService do
  it 'exists' do
    fds = FoodDataService.new

    expect(fds).to be_a(FoodDataService)
  end

  describe 'class methods' do
    context '::search_foods' do 
      it 'returns list of foods that include the query keyword' do
        VCR.use_cassette("sweet_potato_search") do
          response = FoodDataService.search_foods("sweet potato")

          expect(response).to have_key(:totalHits)
          expect(response).to have_key(:currentPage)
          expect(response).to have_key(:pageList)
          expect(response[:totalHits]).to eq(45635)
          expect(response[:foods].size).to eq(50)
          expect(response[:foods].first[:description]).to eq("SWEET POTATO")
        end
      end
    end
  end
end