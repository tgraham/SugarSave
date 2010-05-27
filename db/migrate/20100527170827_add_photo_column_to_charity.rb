class AddPhotoColumnToCharity < ActiveRecord::Migration
  def self.up
    add_column :charities, :photo_file_name, :string
  end

  def self.down
    remove_column :charities, :photo_file_name
  end
end
