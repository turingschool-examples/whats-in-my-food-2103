require 'rails_helper'

RSpec.describe 'Food search results page' do
  before :each do
    @query = "chickpeas"
    response_body = File.read('spec/fixtures/food_search.json')
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=#{@query}&pageSize=10&api_key=#{ENV['FDC_API_KEY']}")
      .to_return(status: 200, body: response_body, headers: {})

    @empty_query = "gibberish"
    empty_body = File.read('spec/fixtures/empty_search.json')
    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=#{@empty_query}&pageSize=10&api_key=#{ENV['FDC_API_KEY']}")
      .to_return(status: 200, body: empty_body, headers: {})

    visit root_path
  end

  it 'has a search form' do
    expect(page).to have_field(:q)
    expect(page).to have_button('Search')
  end

  it 'on submitting search form, shows the total count of results' do
    fill_in :q, with: @query
    click_button 'Search'

    expect(page).to have_current_path "/foods?utf8=%E2%9C%93&q=#{@query}&commit=Search"
    expect(page).to have_content("Total Results: 2075")
  end

  it 'shows the top ten results with GTIN/UPC, description, Brand Owner, and ingredients' do
    fill_in :q, with: @query
    click_button 'Search'

    expect(page).to have_content("741643032903")
    expect(page).to have_content("CHICKPEAS")
    expect(page).to have_content("Lowe's Food Stores, Inc.")
    expect(page).to have_content("PREPARED GARBANZO BEANS, WATER, SALT, CALCIUM CHLORIDE")

    expect(page).to have_content("041415109414")
    expect(page).to have_content("CHICKPEAS")
    expect(page).to have_content("Publix Super Markets, Inc.")
    expect(page).to have_content("PREPARED CHICKPEAS, WATER, SALT, CALCIUM CHLORIDE (FIRMING AGENT)")

    expect(page).to have_content("Chickpeas, from dried, fat added")
  end

  it 'returns an empty page if no search results found' do
    fill_in :q, with: @empty_query
    click_button 'Search'

    expect(page).to have_content("Total Results: 0")
    expect(page).to have_content("No results to display.")
    expect(page).to_not have_content("GTIN/UPC Code")
    expect(page).to_not have_content("Description")
    expect(page).to_not have_content("Brand Owner")
    expect(page).to_not have_content("Ingredients")

  end

end
