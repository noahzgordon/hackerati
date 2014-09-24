require 'rails_helper'

RSpec.describe Bid, :type => :model do
  describe "validations" do
    it "should reject an auctionless bid" do
      expect(build :bid, auction: nil).not_to be_valid
    end
    
    it "should reject a bid with a negative amount" do
      expect(build :bid, amount: -1).not_to be_valid
    end
    
    it "should reject a bid with a zero amount" do
      expect(build :bid, amount: 0).not_to be_valid
    end
    
    it "should allow a bid with complete attributes" do
      expect(build(:bid)).to be_valid
    end
  end
end