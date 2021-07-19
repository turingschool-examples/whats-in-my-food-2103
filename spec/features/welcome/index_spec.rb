require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
  it 'can show the welcome page' do
    visit root_path

    expect(page).to have_link("Ingredient Search", href: root_path)
  end
end
