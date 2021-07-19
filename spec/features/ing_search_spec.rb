require 'rails_helper'

RSpec.describe 'searching using ingredients' do
  describe '/' do
    it 'takes a search term' do
      visit '/'

      fill_in('q', with: 'sweet potatoes')
      click_on('Search')
    end
  end
end