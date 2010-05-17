class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.string :name
      t.text :description
      t.integer :regular_price
      t.integer :initial_discount
      t.integer :max_discount
      t.integer :max_threshold
      t.timestamps
    end
  end
  
  def self.down
    drop_table :deals
  end
end
