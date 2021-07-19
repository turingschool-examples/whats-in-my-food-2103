require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit the root path and search for 'sweet potatoes'" do
    before :each do
      visit "/"
      fill_in (:q), with: 'sweet potatoes'
      click_button 'Search'
    end

    it 'the page should direct to foods index' do
      expect(current_path).to eq(foods_path)
    end

    it 'the page should display total number of items returned in search' do
    end

    it 'the page should display top ten most relevant foods related to ingredient' do
    end

    it 'each food on list should list GTIN/UPC code, description, Brand Owner, and ingredients' do
    end
  end
end
