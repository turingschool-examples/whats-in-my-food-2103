require 'rails_helper'

RSpec.describe FoodFacade do

  describe "search for food info" do

    it "refines food info from service" do

      test = File.read('spec/fixtures/sweet_potato.json')
      stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=LP8KazhHMbzdDWoYbxshVgLsOG1VFoNDaWRgIDTz&query=sweet%20potato").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.5.1'
          }).
        to_return(status: 200, body: test, headers: {})

      output = FoodFacade.search("sweet potato")

      expect(output).to be_a(Array)
      expect(output.length).to eq(10)
      expect(output.first).to be_a (Food)
      expect(output.last).to be_a (Food)
    end
  end
end 
