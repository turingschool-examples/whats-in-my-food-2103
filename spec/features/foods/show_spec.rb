require 'rails_helper'

RSpec.describe "foods show page" do
  describe "Page details" do
    it 'displays the food' do
      expect(page).to have_content('The Tomorrow War')
    end
  end
end
