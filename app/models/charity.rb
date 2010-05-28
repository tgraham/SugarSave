class Charity < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "320x250>", :thumb => "100x100>" },
                    :url => "/assets/charities/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/charities/:id/:style/:basename.:extension"
  
  attr_accessible :name, :description, :photo, :photo_file_name, :start_date, :end_date, :city_id
  
  belongs_to :city
end
