class AddCityIdToCharity < ActiveRecord::Migration
  def self.up
    add_column :charities, :city_id, :integer
  end

  def self.down
    remove_column :charities, :city_id
  end
end
