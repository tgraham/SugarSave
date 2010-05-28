class AddBlurbToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :blurb_title, :string
    add_column :deals, :blurb, :text
    remove_column :deals, :description
  end

  def self.down
    remove_column :deals, :blurb
    remove_column :deals, :blurb_title
    add_column :deals, :description, :text
  end
end
