require 'rails_helper'

RSpec.describe FoodService do

  describe "search for food info" do

    it "gets food info from api" do
      response = FoodService.search("sweet potato")

      expect(response).to be_a(Hash)
    end
  end



end
