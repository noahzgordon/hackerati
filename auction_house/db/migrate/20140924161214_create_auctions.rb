class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.references :item
      t.integer :status
      
      t.timestamps
    end
  end
end
