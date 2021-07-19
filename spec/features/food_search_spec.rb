require 'rails_helper'

RSpec.describe 'Welcome Page' do
    describe 'when I search for a food in the search form' do
        it 'can return a result of 10 foods from the relevant search ingredient' do
            visit root_path
            fill_in :q, with: 'sweet potatoes'
            click_on "Search"
            expect(current_path).to eq('/foods')

            expect(page).to have_content("45635 Results")
            expect(page).to have_content("492111402857")
            expect(page).to have_content("sweet potatoes")
            expect(page).to have_content("ARCHER FARMS")
            expect(page).to have_content("SWEET POTATOES.")
        end
    end
end