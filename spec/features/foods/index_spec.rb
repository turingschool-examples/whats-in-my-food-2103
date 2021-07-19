require 'rails_helper'

RSpec.describe 'Foods Index Page' do
  it 'can show the food I searched for' do
    visit root_path

    fill_in "q", with: "sweet potatoes"
    click_button "Search"

    visit foods_path

    expect(page).to have_content("items found")
  end
end
