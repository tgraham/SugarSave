class AddTippingPointToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :tipping_point, :integer
  end

  def self.down
    remove_column :deals, :tipping_point
  end
end
