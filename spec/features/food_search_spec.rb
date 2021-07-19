require 'rails_helper'

RSpec.describe 'Welcome Page' do
    describe 'when I search for a food in the search form' do
        it 'can return a result of 10 foods from the relevant search ingredient' do
            visit root_path
            fill_in :q, with: 'sweet potatoes'
            click_on "Search"
            expect(current_path).to eq('/foods')
        end
    end
end