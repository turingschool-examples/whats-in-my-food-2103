require 'rails_helper'

RSpec.describe 'search food request' do
  it 'can return json for a search result' do
    json = FDCService.search_foods("sweet potatoes")

    expect(json).to be_a(Hash)
    expect(json[:foods]).to be_an(Array)
  end
end