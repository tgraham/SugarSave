class CreateCharities < ActiveRecord::Migration
  def self.up
    create_table :charities do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :charities
  end
end
