require 'rails_helper'

RSpec.describe FoodsFacade do
  describe 'methods' do
    it "gets food details", :vcr do
      details = FoodsFacade.foods('Sweet potatoes')

      expect(details).to be_an(Array)
      expect(details.first).to be_an(Food)
      expect(details.first.gtinUpc).to be_an(String)
      expect(details.first.description).to be_a(String)
      expect(details.first.brandOwner).to be_a(String)
      expect(details.first.ingredients).to be_a(String)
    end

    it 'gets results count', :vcr do

      details = FoodsFacade.results_number('Sweet potatoes')

      expect(details).to be_an(Integer)
    end
  end
end
