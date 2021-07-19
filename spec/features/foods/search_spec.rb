require 'rails_helper'

RSpec.describe 'foods' do
  before :each do
    visit root_path
  end

  describe 'search' do
    describe 'search foods' do
      xit 'can search for foods' do
        VCR.use_cassette "search_results" do
          fill_in :q, with: "Sweet Potatoes"
          click_on "Search"
          expect(current_path).to eq("/foods")
          expect(page).to have_content("Search Results")
        end
      end
    end
  end
end