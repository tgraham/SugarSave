class AddDealTypeToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :deal_type, :string
  end

  def self.down
    remove_column :deals, :deal_type
  end
end
