class User < ActiveRecord::Base
  enum user_type: [:participant, :auctioneer]
  
  has_many :bids, inverse_of: :bidder
  has_many :bought_items, class_name: "Item", inverse_of: :owner
  
  validates :username, :user_type, presence: true
end