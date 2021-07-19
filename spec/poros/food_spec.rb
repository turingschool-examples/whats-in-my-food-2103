require 'rails_helper'

RSpec.describe Food do
  it 'exists' do
    VCR.use_cassette('fooddata_make_poro', :record => :new_episodes) do
      data = FoodDataService.search('apple')
      data = data[:foods].first
      apple = Food.new(data)

      expect(apple).is_a? Food
      expect(apple.description).is_a? String
      expect(apple.code).is_a? String
      expect(apple.brand).is_a? String
      expect(apple.ingredients).is_a? String
      expect(apple.description).to eq 'APPLE'
      expect(apple.code).to eq '070038322238'
      expect(apple.brand).to eq 'Associated Wholesale Grocers, Inc.'
      expect(apple.ingredients).to eq 'FILTERED WATER, APPLE JUICE CONCENTRATE, ASCORBIC ACID (VITAMIN C).'
    end
  end
end