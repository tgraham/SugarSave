class AddEndDateToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :end_date, :date
  end

  def self.down
    remove_column :deals, :end_date
  end
end
