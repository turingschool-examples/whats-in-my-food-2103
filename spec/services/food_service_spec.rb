require 'rails_helper'

RSpec.describe 'FoodService' do
  describe 'class methods' do
    describe '.food_search' do
      it 'returns a json responce for a search term' do
        VCR.use_cassette 'sweet_tato_service' do
          actual = FoodService.food_search('sweet potatoes')

          expect(actual[:totalHits]).to eq(45635)
          expect(actual.class).to eq(Hash)
          expect(actual[:foods][0][:fdcId]).to eq(535125)
        end
      end
    end
  end
end