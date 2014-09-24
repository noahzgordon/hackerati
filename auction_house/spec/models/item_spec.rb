require 'rails_helper'

RSpec.describe Item, :type => :model do
  describe "validations" do
    it "should require a name" do
      expect(Item.new(price: 200)).not_to be_valid
    end
    
    it "should require a price" do
      expect(Item.new(name: "Test Name")).not_to be_valid
    end
    
    it "should reject a blank name" do
      expect(build(:item, name: "")).not_to be_valid
    end
    
    it "should reject a negative price" do
      expect(build(:item, price: -1)).not_to be_valid
    end
    
    it "should allow an item with complete attributes" do
      expect(build(:item)).to be_valid
    end
  end
  
  describe "associations" do
    it "responds to a call for its auction" do
      expect(build(:item)).to respond_to(:auction)
    end
  end
  
  describe "#sold?" do
    it "should respond to the sold? method" do
      expect(build(:item)).to respond_to(:sold?)
    end
    
    it "should return true for an item with an owner" do
      expect(build(:item, owner: build(:participant)).sold?).to be(true)
    end
  end
  
  describe "#query" do
    it "should respond to the query method" do
      expect(Item).to respond_to(:query)
    end
    
    describe "for an item with a completed auction" do
      let(:item) { create(:item) }
      let(:auction) { create(:auction, item: item) }
      let(:winner) { create(:participant) }
      before do
        auction.bids.create([
          { amount: 50, bidder: create(:participant) },
          { amount: 60, bidder: create(:participant) },
          { amount: 110, bidder: winner }
        ])  
        auction.call
      end
      
      it "should return a JSON object with the item's information" do
        expect(Item.query(item.name)).to eq({
          auction_status: "success",
          sold: true,
          selling_price: 110,
          sold_to: winner
        }.to_json)
      end
    end
    
    describe "for a brand new item" do
      let(:item) { create(:item) }
    
      it "should return a JSON object with the item's information" do
        expect(Item.query(item.name)).to eq({
          auction_status: nil,
          sold: false,
          selling_price: nil,
          sold_to: nil
        }.to_json)
      end
    end
  end
end
