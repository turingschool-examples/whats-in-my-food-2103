require 'rails_helper'

RSpec.describe FoodDataFacade do
  it 'exists' do
    fd = FoodDataFacade.new 

    expect(fd).to be_a(FoodDataFacade)
  end
end 