require 'rails_helper'

RSpec.describe 'The welcome page' do
  describe 'search form' do
    it 'navigates the user to the /food page' do
      visit '/'

      within 'form' do
        fill_in 'q', with: 'sweet potatoes'
        click_button 'Search'
      end

      expect(current_path).to eq foods_path
    end
  end
end