require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe 'welcome index' do
    it 'displays elements on welcome page' do
      visit root_path

      expect(page).to have_content("Ingredient Search")
      expect(page).to have_button("Search")

      fill_in :q, with: 'sweet potatoes'
      click_button "Search"

      expect(current_path).to eq(foods_path)
    end
  end
end
