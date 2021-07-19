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
          require 'pry'; binding.pry
          expect(response).to have_key(:total)
          expect(response).to have_key(:limit)
          expect(response[:data].size).to eq(15)
        end
      end
    end
  end

end