class Item < ActiveRecord::Base
  has_one :auction, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: :owner_id, primary_key: :id
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  def self.query(item_name)
    item = Item.find_by_name(item_name)
    
    {
      auction_status: item.auction ? item.auction.status : nil,
      sold: item.sold?,
      selling_price: item.selling_price,
      sold_to: item.owner
    }.to_json
  end
  
  def sold?
    self.owner ? true : false
  end
  
  def selling_price
    return nil if !auction
    return nil if !auction.success?
    auction.high_bid.amount
  end
end
