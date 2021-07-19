require 'rails_helper'

RSpec.describe 'Foods page' do
  it 'displays searched for foods' do
    visit '/'
    fill_in 'q', with: 'sweet potatoes'
    click_button 'Search'

    expect(current_path).to eq '/foods'
  end

  it 'only displays 10' do
    visit '/'
    fill_in 'q', with: 'sweet potatoes'
    click_button 'Search'

    expect(current_path).to eq '/foods'
  end

  it 'displays number of items returned by search'


end