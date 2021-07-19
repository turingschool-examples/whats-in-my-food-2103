require 'rails_helper'

RSpec.describe 'foods index page' do

  it "search sends you to food inex page" do

    visit '/'

    fill_in "q", with: "Sweet potato"
    click_button "Search"

    expect(current_path).to eq("/foods")
  end


  # describe "search sends you to food inex page" do
  #
  #   visit '/'
  #
  #   fill_in "q", with: "Sweet potato"
  #   click_button "Search"
  #
  #   expect(current_path).to eq("/foods")
  #
  #
  #
  # end
end
