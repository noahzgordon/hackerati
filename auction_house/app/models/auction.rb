class Auction < ActiveRecord::Base
  enum status: [:pending, :failure, :success]
  
  validates :status, presence: true
  validates :item, presence: true
  
  after_initialize :default_status_to_pending
  
  private
  
  def default_status_to_pending
    self.status ||= "pending"
  end
end
