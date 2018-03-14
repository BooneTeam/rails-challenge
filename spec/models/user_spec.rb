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
end
