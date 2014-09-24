class Item < ActiveRecord::Base
  has_one :auction
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
