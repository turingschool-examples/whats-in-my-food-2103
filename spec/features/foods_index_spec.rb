require 'rails_helper'

RSpec.describe 'Foods index' do
  it 'returns the data for first ten matches' do

    response_body = File.open('spec/fixtures/sweet_potatoes.json')

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['api_key']}&pageSize=10&query=sweet%20potatoes").
    to_return(status: 200, body: response_body, headers: {})

    visit root_path
    fill_in :q, with: 'sweet potatoes'
    click_on 'Search'

    expect(current_path).to eq(foods_path)
    expect(page).to have_content('Total Results: 45635')
    expect(page).to have_content('UPC:', count: 10)
    expect(page).to have_content('492111402857')
    expect(page).to have_content('Description:', count: 10)
    expect(page).to have_content('SWEET POTATOES')
    expect(page).to have_content('Brand/Owner:', count: 10)
    expect(page).to have_content('ARCHER FARMS')
    expect(page).to have_content('Ingredients:', count: 10)
    expect(page).to have_content('SWEET POTATOES.')
  end
end
