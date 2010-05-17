class Company < ActiveRecord::Base
  attr_accessible :name, :phone, :address, :city_id, :zip_code, :website
  belongs_to :city
  belongs_to :deal
end
