require 'rails_helper'

RSpec.describe 'as a user' do
  it 'I can search foods' do
    response = File.read("#{Rails.root}/spec/fixtures/food_api/sweet_potato_10_results_search.json")
    parsed_response = JSON.parse(response, symbolize_names: true)[:foods].first

    stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?query=sweet potato&pageSize=10&api_key=#{ENV['FOOD_API_KEY']}").to_return(status: 200, body: response, headers: {})

    visit root_path

    fill_in :q, with: "sweet potatoes"
    click_button "Search"
    expect(current_path).to eq("/foods")

    it 'and see the total numbers of search results' do
      expect(page).to have_content("Total Results: ")
    end

    it 'and see 10 foods containing my search term' do
      expect(page).to have_css('single-result', count: 10)
    end
    
    it 'for each food I should see details' do
      within(".single_result", match: :first) do
        expect(page).to have_content("GTIN/UPC Code: #{parsed_response[:gtinUpc]}")
        expect(page).to have_content("Description: #{parsed_response[:description]}")
        expect(page).to have_content("Brand Owner: #{parsed_response[:brandOwner]}")
        expect(page).to have_content("Ingredients: #{parsed_response[:ingredients]}")
      end
    end
  end
end
