class AddSearchNameToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :search_name, :string
  end

  def self.down
    remove_column :cities, :search_name
  end
end
