class Bid < ActiveRecord::Base
  belongs_to :auction
  
  validates :auction, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
