class AddCityIdToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :city_id, :integer
    add_column :deals, :deal_date, :datetime
    add_column :deals, :company_id, :integer
    add_column :deals, :approved, :boolean
  end

  def self.down
    remove_column :deals, :city_id
    remove_column :deals, :deal_date
    remove_column :deals, :company_id
    remove_column :deals, :approved
  end
end
