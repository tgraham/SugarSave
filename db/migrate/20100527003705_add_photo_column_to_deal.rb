class AddPhotoColumnToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :photo_file_name, :string
  end

  def self.down
    remove_column :deals, :photo_file_name
  end
end
