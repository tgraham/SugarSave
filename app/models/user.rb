class User < ActiveRecord::Base
  acts_as_authentic
  is_gravtastic
  
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :city_id, :role
  belongs_to :city
  
  validate :first_name, :presence => true
  
  ROLES = %w[admin metro]
  
  def full_name(user)
    user.first_name+' '+user.last_name
  end
  
  def deliver_reset_email!
    reset_perishable_token!
    NotifierMailer.reset_email(self).deliver
  end
end
