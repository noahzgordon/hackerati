class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :type
      
      t.timestamps
    end
  end
end
