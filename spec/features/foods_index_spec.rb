require 'rails_helper'

RSpec.describe 'Foods index' do
  it 'Shows total results' do

    response_body = File.open('spec/fixtures/sweet_potatoes.json')

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['api_key']}&pageSize=10&query=sweet%20potatoes").
    to_return(status: 200, body: response_body, headers: {})

    visit root_path
    fill_in :q, with: 'sweet potatoes'
    click_on 'Search'

    expect(current_path).to eq(foods_path)
    expect(page).to have_content('Total Results: 45635')
  end

  it 'shows upc' do

      response_body = File.open('spec/fixtures/sweet_potatoes.json')

      stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['api_key']}&pageSize=10&query=sweet%20potatoes").
      to_return(status: 200, body: response_body, headers: {})

      visit root_path
      fill_in :q, with: 'sweet potatoes'
      click_on 'Search'

    expect(page).to have_content('UPC:', count: 10)
    expect(page).to have_content('492111402857')
  end

  it 'shows description' do

    response_body = File.open('spec/fixtures/sweet_potatoes.json')

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['api_key']}&pageSize=10&query=sweet%20potatoes").
    to_return(status: 200, body: response_body, headers: {})

    visit root_path
    fill_in :q, with: 'sweet potatoes'
    click_on 'Search'

    expect(page).to have_content('Description:', count: 10)
    expect(page).to have_content('SWEET POTATOES')
  end

  it 'shows the brand or owner' do
    response_body = File.open('spec/fixtures/sweet_potatoes.json')

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['api_key']}&pageSize=10&query=sweet%20potatoes").
    to_return(status: 200, body: response_body, headers: {})

    visit root_path
    fill_in :q, with: 'sweet potatoes'
    click_on 'Search'

    expect(page).to have_content('Brand/Owner:', count: 10)
    expect(page).to have_content('ARCHER FARMS')
  end

  it 'shows the ingredients' do
    response_body = File.open('spec/fixtures/sweet_potatoes.json')

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['api_key']}&pageSize=10&query=sweet%20potatoes").
    to_return(status: 200, body: response_body, headers: {})

    visit root_path
    fill_in :q, with: 'sweet potatoes'
    click_on 'Search'

    expect(page).to have_content('Ingredients:', count: 10)
    expect(page).to have_content('SWEET POTATOES.')
  end

end
