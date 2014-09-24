class Bid < ActiveRecord::Base
  belongs_to :auction
  
  validates :auction, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  belongs_to :bidder, class_name: "User"
  
  validate :new_bid_not_lower_than_prev_bid
  
  private
  
  def new_bid_not_lower_than_prev_bid
    if auction && auction.high_bid && amount < auction.high_bid.amount
      errors[:amount] << "must be higher than the current highest bid."
    end
  end
end
