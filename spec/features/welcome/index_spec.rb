require 'rails_helper'

RSpec.describe 'welcome index' do
  before :each do
    visit root_path
  end

  describe 'form' do
    it 'has a form' do
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Ingredient Search")
    end
  end
end
