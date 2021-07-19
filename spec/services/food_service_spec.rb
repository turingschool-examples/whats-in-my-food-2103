require 'rails_helper'

RSpec.describe 'FoodService' do
  it 'can return the correctly structured data' do
    search_results = FoodService.food_search('sweet potatoes')

    expect(search_results).to have_key(:totalHits)
    expect(search_results[:totalHits]).to eq(45635)

    expect(search_results).to have_key(:foods)
    expect(search_results[:foods][0]).to have_key(:gtinUpc)
    expect(search_results[:foods][0]).to have_key(:description)
    expect(search_results[:foods][0]).to have_key(:brandOwner)
    expect(search_results[:foods][0]).to have_key(:ingredients)

    expect(search_results).to be_a(Hash)
    expect(search_results[:totalHits]).to be_an(Integer)
    expect(search_results[:foods]).to be_an(Array)
    expect(search_results[:foods][0][:gtinUpc]).to be_a(String)
    expect(search_results[:foods][0][:description]).to be_a(String)
    expect(search_results[:foods][0][:brandOwner]).to be_a(String)
    expect(search_results[:foods][0][:ingredients]).to be_a(String)
  end
end
