require 'rails_helper'

RSpec.describe Food do
  it 'exists' do
    VCR.use_cassette('fooddata_make_poro', :record => :new_episodes) do
      data = FoodDataService.search('potato')
      binding.pry
      data = data[:foods].first
      binding.pry
      potato = Food.new(data)

      expect(potato).is_a? Food
      expect(potato.description).is_a? String
      expect(potato.code).is_a? String
      expect(potato.brand).is_a? String
      expect(potato.ingredients).is_a? String
    end
  end
end