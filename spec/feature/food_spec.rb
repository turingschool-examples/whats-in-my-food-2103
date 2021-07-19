require 'rails_helper'

RSpec.describe 'Food index page' do
  describe 'list of searched foods' do
    it 'shows 10 food results from the search'
  end

  describe 'food list,' do
    context 'each food item' do
      it 'shows the GTIN/UPC code'
      it 'shows a description'
      it 'shows the brand owner'
      it 'shows the ingredients'
    end
  end
end