require 'rails_helper'

RSpec.describe 'The welcome page' do
  describe 'search form' do
    it 'navigates the user to the /food page' do
      visit '/'

      within 'form' do
        fill_in 'foods[q]', with: 'sweet potatoes'
      end

      expect(current_path).to eq foods_path
    end
  end
end