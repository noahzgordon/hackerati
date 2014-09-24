class AddBidderToBids < ActiveRecord::Migration
  def change
    add_column :bids, :bidder_id, :integer
  end
end
