require 'rails_helper'

RSpec.describe 'searching using ingredients' do
  describe '/' do
    it 'takes a search term' do
      visit '/'
      save_and_open_page

      expect(page).to have_field
    end
  end
end