require 'rails_helper'

RSpec.describe FoodsFacade do
  describe 'methods' do
    it "gets food details", :vcr do
      details = FoodsFacade.foods('Sweet potatoes')

      expect(details).to be_an(FoodObject)
      expect(details.gtinUpc).to be_an(Integer)
      expect(details.description).to be_a(String)
      expect(details.brandOwner).to be_a(String)
      expect(details.ingredients).to be_a(String)
    end

    it 'gets results count', :vcr do

      details = FoodsFacade.results_number('Sweet potatoes')

      expect(details).to be_an(Integer)
    end
  end
end

#test
