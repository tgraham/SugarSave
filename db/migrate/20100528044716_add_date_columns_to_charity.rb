class AddDateColumnsToCharity < ActiveRecord::Migration
  def self.up
    add_column :charities, :start_date, :date
    add_column :charities, :end_date, :date
  end

  def self.down
    remove_column :charities, :end_date
    remove_column :charities, :start_date
  end
end
