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
end
