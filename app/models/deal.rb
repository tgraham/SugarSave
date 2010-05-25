class Deal < ActiveRecord::Base
  attr_accessible :name, :description, :regular_price, :initial_discount, :max_discount, :max_threshold, 
                  :deal_date, :city_id, :company_id, :approved, :fine_prints_attributes
  belongs_to :company
  belongs_to :city
  has_many :fine_prints, :dependent => :destroy
  has_many :highlights, :dependent => :destroy
  
  accepts_nested_attributes_for :fine_prints, :reject_if => lambda { |a| a[:description].blank? }
  accepts_nested_attributes_for :highlights, :reject_if => lambda { |a| a[:description].blank? }
end
