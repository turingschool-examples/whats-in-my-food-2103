require 'rails_helper'

RSpec.describe FoodDataService do
  it 'exists' do
    fds = FoodDataService.new
    
    expect(fds).to be_a(FoodDataService)
  end

end