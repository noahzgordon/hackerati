class User < ActiveRecord::Base
  enum user_type: [:participant, :auctioneer]
  
  has_many :bids, inverse_of: :bidder
  has_many :bought_items, class_name: "Item", foreign_key: :owner_id, primary_key: :id
  
  validates :username, :user_type, presence: true
end