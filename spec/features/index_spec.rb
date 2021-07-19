require 'rails_helper'

RSpec.describe 'index page' do
  it 'shows a food' do
    visit '/'

    fill_in 'q', with: 'sweet potato'
    click_on 'Search'

    expect(current_path).to eq('/foods')
    expect(page).to have_content('Sweet potato')
    expect(page).to have_content('Total items')
  end
end
