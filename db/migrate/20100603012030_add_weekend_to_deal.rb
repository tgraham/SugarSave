class AddWeekendToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :weekend, :boolean
  end

  def self.down
    remove_column :deals, :weekend
  end
end
