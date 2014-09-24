class User < ActiveRecord::Base
  enum type: [:participant, :auctioneer]
  
  validates :name, :type, presence: true
end
