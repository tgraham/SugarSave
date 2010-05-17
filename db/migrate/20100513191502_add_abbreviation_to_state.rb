class AddAbbreviationToState < ActiveRecord::Migration
  def self.up
    add_column :states, :abbreviation, :string
  end

  def self.down
    remove_column :states, :abbreviation
  end
end
