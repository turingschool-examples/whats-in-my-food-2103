require 'rails_helper'

RSpec.describe FoodService do

  describe "search for food info" do

    it "gets food info from api" do

      test = File.read('spec/fixtures/sweet_potato.json')
      stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=LP8KazhHMbzdDWoYbxshVgLsOG1VFoNDaWRgIDTz&query=sweet%20potato").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.5.1'
          }).
        to_return(status: 200, body: test, headers: {})

      response = FoodService.search("sweet potato")

      expect(response).to be_a(Hash)
      expect(response[:foods]).to be_a(Array)
      expect(response[:foods][0][:description]).to eq("SWEET POTATO")
    end
  end



end
