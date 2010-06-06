class Recommendation < ActiveRecord::Base
  attr_accessible :from_email, :to_email, :subject, :message, :deal_id, :name
  
  belongs_to :deal
  
  validates :name, :subject, :message,  :presence => true
  
  validates :from_email,  :presence => true, 
                          :length => {:minimum => 3, :maximum => 254},
                          :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  validates :to_email,    :presence => true, 
                          :length => {:minimum => 3, :maximum => 254},
                          :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
end
