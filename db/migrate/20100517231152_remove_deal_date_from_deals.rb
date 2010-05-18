class RemoveDealDateFromDeals < ActiveRecord::Migration
  def self.up
    remove_column :deals, :deal_date
    add_column :deals, :deal_date, :date
  end

  def self.down
    remove_column :deals, :deal_date
    add_column :deals, :deal_date, :datetime
  end
end
