require 'rails_helper'

RSpec.describe 'Foods Index' do
  describe 'List of Foods from Search' do
    it 'displays attributes of foods from search' do
      visit root_path

      fill_in :q, with: 'sweet potatoes'
      click_button "Search"

      expect(current_path).to eq(foods_path)

      expect(page).to have_content("Data on sweet potatoes")
      expect(page).to have_content("Total search results for sweet potatoes is:")

      sweet_potatoes_list = find("#ten_food_results").all("div")
      expect(sweet_potatoes_list.size).to eq(10)

      # within("#ten_food_results") do
      #   expect().to eq()
      # end
    end
  end
end
