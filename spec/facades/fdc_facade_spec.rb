require 'rails_helper'

RSpec.describe 'FDC Facade' do
  it 'creates food objects from food data' do
    response_body = File.open('spec/fixtures/sweet_potatoes.json')

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=hfOXFebrbJl5BavYcEGOq2GmfcIIogi8ctDDWGI5&pageSize=10&query=sweet%20potatoes").
      to_return(status: 200, body: response_body, headers: {})

    foods = FdcFacade.get_search_results('sweet potatoes')

    expect(foods[0]).to be_a(Food)
    expect(foods.count).to eq(10)
  end
end
