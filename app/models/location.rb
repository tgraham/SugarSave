class Location < ActiveRecord::Base
  attr_accessible :name, :zip_code
  
  validates :name, :zip_code, :presence => true
end
