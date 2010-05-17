class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_accessible :username, :email, :password, :password_confirmation, :city_id, :role
  belongs_to :city
  
  ROLES = %w[admin metro]
end
