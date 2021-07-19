require 'rails_helper'

RSpec.describe 'Food search results page' do
  before :each do
    @query = "chickpeas"
    response_body = File.read('spec/fixtures/food_search.json')
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=#{@query}&pageSize=10&api_key=#{ENV['FDC_API_KEY']}")
      .to_return(status: 200, body: response_body, headers: {})

    visit root_path
  end

  it 'has a search form' do
    expect(page).to have_field(:q)
    expect(page).to have_button('Search')
  end

  it 'on submitting search form, shows the total count of results' do
    fill_in :q, with: @query
    click_button 'Search'

    expect(page).to have_current_path '/foods'
    expect(page).to have_content("Total Results: 2075")
  end

  it 'shows the top ten results with GTIN/UPC, description, Brand Owner, and ingredients' do

  end
end
