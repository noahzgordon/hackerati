class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false, unique: true
      t.integer :price, null: false
      t.references :owner_id
      
      t.timestamps
    end
  end
end
