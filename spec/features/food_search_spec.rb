require 'rails_helper'

RSpec.describe '/foods', :vcr do
  it 'should go to /foods' do
    visit '/'
    fill_in 'q', with: 'tumeric'
    click_on 'Search'
    expect(page).to have_current_path('/foods',ignore_query: true)
  end

  it 'should have info on page' do
    visit '/'
    fill_in 'q', with: 'tumeric'
    click_on 'Search'
    expect(page).to have_content('Your query found 432 results for tumeric')
    expect(page).to have_content("Brand Owner: ")
    expect(page).to have_content('GTIN/UPC: ')
    expect(page).to have_content('Description: ')
    expect(page).to have_content('Ingredients: ')
    # count elememts on page only ten
  end
end

RSpec.describe 'Foods', :vcr do
  it 'should create foods object' do
    info = {
      'totalHits' => 100,
      'foods' => (1..10).map do 
        {
          'gtinUpc' => Faker::Number.number(digits: 12),
          'brandOwner' => Faker::Company.name,
          'description' => Faker::Lorem.sentence(word_count: 3),
          'ingredients' => Faker::Lorem.sentence(word_count: 6)
        }
      end
    }
    foods = Foods.new(info)
    expect(foods).to be_a(Foods)
    expect(foods.total_hits).to eq(100)
    expect(foods.foods.size).to eq(10)
  end
end
