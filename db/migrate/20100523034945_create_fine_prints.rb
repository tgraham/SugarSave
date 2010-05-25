class CreateFinePrints < ActiveRecord::Migration
  def self.up
    create_table :fine_prints do |t|
      t.string :description
      t.integer :deal_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :fine_prints
  end
end
