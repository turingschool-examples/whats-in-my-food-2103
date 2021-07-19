require 'rails_helper'

RSpec.describe 'searching using ingredients' do
  describe '/' do
    it 'takes a search term' do
      visit '/'

      fill_in('q', with: 'sweet potatoes')
      click_on('Search')

      expect(page).to have_current_path('/foods', ignore_query: true)
    end
  end
end