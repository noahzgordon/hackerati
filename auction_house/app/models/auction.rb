class Auction < ActiveRecord::Base
  enum status: [:pending, :failure, :success]
  
  belongs_to :item
  has_many :bids, -> { order "amount DESC"}, dependent: :destroy
  
  validates :status, presence: true
  validates :item, presence: true
  
  after_initialize :default_status_to_pending
  
  def high_bid
    self.bids.first
  end
  
  def call
    if self.high_bid.amount > self.item.price
      self.success!
      self.item.owner = self.high_bid.bidder
    else
      self.failure!
    end
  end
  
  private
  
  def default_status_to_pending
    self.status ||= "pending"
  end
end
