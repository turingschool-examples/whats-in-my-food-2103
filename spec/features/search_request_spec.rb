require 'rails_helper'

RSpec.describe 'food search' do
  it 'can return the total number of foods that contain the search' do
    visit '/'

    fill_in :q, with: "sweet potatoes"
    click_on "Search"
  end
end