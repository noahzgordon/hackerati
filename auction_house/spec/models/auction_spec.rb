require 'rails_helper'

RSpec.describe Auction, :type => :model do
  describe "validations" do
    it "should reject an itemless auction" do
      expect(build :auction, item: nil).not_to be_valid
    end
  end
end
