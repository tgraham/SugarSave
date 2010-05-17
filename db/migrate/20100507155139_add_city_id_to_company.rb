class AddCityIdToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :city_id, :integer
    add_column :companies, :zip_code, :integer
    remove_column :companies, :address
    add_column :companies, :address, :string
  end

  def self.down
    remove_column :companies, :city_id
    remove_column :companies, :zip_code
    remove_column :companies, :address
    add_column :companies, :address, :text
  end
end
