class Item < ActiveRecord::Base
  has_one :auction, dependent: :destroy
  belongs_to :owner, class_name: "User"
  
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def sold?
    self.owner ? true : false
  end
  
  def selling_price
    return nil if !auction
    return nil if !auction.success?
    auction.high_bid.amount
  end
  
  def query
    {
      auction_status: auction ? auction.status : nil,
      sold: sold?,
      selling_price: selling_price,
      sold_to: owner
    }.to_json
  end
end
