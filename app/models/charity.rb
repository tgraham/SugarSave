class Charity < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "320x250>", :thumb => "100x100>" }
  
  attr_accessible :name, :description, :photo, :photo_file_name
end
