require 'rails_helper'

RSpec.describe Auction, :type => :model do
  describe "validations" do
    it "should reject an itemless auction" do
      expect(build :auction, item: nil).not_to be_valid
    end
    
    it "should allow an auction with complete attributes" do
      expect(build(:auction)).to be_valid
    end
  end
  
  describe "associations" do
    it "responds to a call for its bids" do
      expect(build(:auction)).to respond_to(:bids)
    end
  end
end
