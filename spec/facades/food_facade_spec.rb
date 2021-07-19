require 'rails_helper'

RSpec.describe FoodFacade do
  it 'can find the total number of items returned by the search' do
    expect(FoodFacade.total_items_returned("sweet potatoes")).to eq(45635)
    expect(FoodFacade.total_items_returned("avocados")).to eq(1544)
  end
end
