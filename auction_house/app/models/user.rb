class User < ActiveRecord::Base
  enum type: [:participant, :auctioneer]
  
  has_many :bids, inverse_of: :bidder
  
  validates :name, :type, presence: true
end