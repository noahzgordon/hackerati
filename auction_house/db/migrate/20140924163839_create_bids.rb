class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :auction
      t.integer :amount, null: false
      
      t.timestamps
    end
  end
end
