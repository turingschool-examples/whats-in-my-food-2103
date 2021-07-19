require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do

  describe 'page appearance' do
    it 'welcomes' do
      visit '/'

      expect(page).to have_content('Ingredient Search')
    end
  end

  describe "Search for Ingredient" do
    it "sends search to food show page" do
      visit root_path

      within ".form-inline" do
        fill_in :q, with: 'sweet potatos'
      end

      click_on "Search"

      expect(current_path).to eq('/foods')
    end
  end
end
