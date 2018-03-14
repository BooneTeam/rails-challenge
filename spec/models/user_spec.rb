require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#valid?" do
    let(:user1) { User.new(full_name: 'Jimmy', website_full_url: 'www.garrettaustinboone.com') }
    let(:user2) { User.new(website_full_url: 'www.garrettaustinboone.com') }
    let(:user3) { User.new(full_name: 'Jimmy') }
    it 'is valid with a name and website URL' do
      expect(user1).to be_valid
    end

    it 'is NOT valid without a name or website URL' do
      expect(user2).to be_invalid
      expect(user3).to be_invalid
    end
  end

  describe ".create" do
    let(:user) { User.new(full_name: 'Jimmy', website_full_url: 'www.garrettaustinboone.com') }
    it "creates a shortened url after create" do
      user.stub(:insert_url).and_return(
        OpenStruct.new(id: "https://goo.gl/yn3DMi",
            kind: "urlshortener#url",
            long_url: "http://www.garrettaustinboone.com/")
      )
      user.save
      expect(user.google_short_url).to eq('https://goo.gl/yn3DMi')
    end
  end
end
