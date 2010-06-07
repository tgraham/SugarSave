class Contact < ActiveRecord::Base  
  def self.columns() @columns ||= []; end  

  def self.column(name, sql_type = nil, default = nil, null = true)  
   columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)  
  end

  column :from_email, :string
  column :message, :text
  
  attr_accessible :from_email, :message
  
  validates :from_email,  :presence => true, 
                          :length => {:minimum => 3, :maximum => 254},
                          :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
                          
  validates :message,     :presence => true
  
end
