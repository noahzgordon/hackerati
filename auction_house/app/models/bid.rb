class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :bidder, class_name: "User"
  
  validates :auction, :bidder, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  
  validate :new_bid_not_lower_than_prev_bid
  validate :bidder_is_a_participant
  
  private
  
  def new_bid_not_lower_than_prev_bid
    if auction && auction.high_bid && amount < auction.high_bid.amount
      errors[:amount] << "must be higher than the current highest bid."
    end
  end
  
  def bidder_is_a_participant
    if bidder && !bidder.participant?
      errors[:bidder] << 'must be a participant.'
    end
  end
end
