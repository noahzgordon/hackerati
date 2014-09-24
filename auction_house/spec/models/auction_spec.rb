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
  
  it "should respond to the call method" do
    expect(build(:auction)).to respond_to(:call)
  end
  
  it "should respond to the high_bid method" do
    expect(build(:auction)).to respond_to(:high_bid)
  end
  
  context "after being called without a high bid" do
    let(:auction) { create(:auction) }
    before do
      auction.bids.create([
        { amount: 50 },
        { amount: 60 },
        { amount: 70 }
      ])  
      auction.call
    end
    
    it "should automatically update as a failed auction" do
      expect(auction.status).to eq("failure")
    end
  end
  
  context "after being called with a high bid" do
    let(:auction) { create(:auction) }
    before do
      auction.bids.create([
        { amount: 50 },
        { amount: 60 },
        { amount: 110 }
      ])  
      auction.call
    end
    
    it "should automatically update as a successful auction" do
      expect(auction.status).to eq("success")
    end
    
    it "should successfully retreive the high bid" do
      expect(auction.high_bid.amount).to be(110)
    end
  end
end
