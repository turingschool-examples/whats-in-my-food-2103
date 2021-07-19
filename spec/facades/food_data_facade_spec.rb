require 'rails_helper'

RSpec.describe FoodDataFacade do
  it 'exists' do
    fd = FoodDataFacade.new 

    expect(fd).to be_a(FoodDataFacade)
  end

  describe 'class methods' do
    describe '::foods' do
      it 'returns list of foods according to food query' do
        foods = FoodDataFacade.foods("sweet potato")
        first = foods.first
   
        expect(foods).to be_a(Array)
        expect(foods.count).to eq(10)
        expect(first.code).to eq('20042431')
        expect(first.description).to eq('SWEET POTATO')
        expect(first.ingredients.size).to eq(587)
        expect(first.owner).to eq("FRESH & EASY")
      end
    end
  end
end 