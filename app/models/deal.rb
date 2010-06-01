class Deal < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "320x250>", :thumb => "128x100>" },
                    :url => "/assets/deals/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/deals/:id/:style/:basename.:extension"
  
  attr_accessible :name, :blurb, :blurb_title, :regular_price, :initial_discount, :max_discount, :max_threshold, 
                  :deal_date, :city_id, :company_id, :approved, :fine_prints_attributes, :highlights_attributes,
                  :photo, :photo_file_name
                  
  belongs_to :company
  belongs_to :city
  
  has_many :fine_prints, :dependent => :destroy
  has_many :highlights, :dependent => :destroy
  
  accepts_nested_attributes_for :fine_prints, :reject_if => lambda { |a| a[:description].blank? }
  accepts_nested_attributes_for :highlights, :reject_if => lambda { |a| a[:description].blank? }
  
  after_update :remove_empty_fine_prints
  after_update :remove_empty_highlights
  
  def remove_empty_fine_prints
    fine_prints.delete fine_prints.select{ |fine_print| fine_print.description.blank?}
  end
  
  def remove_empty_highlights
    highlights.delete highlights.select{ |highlight| highlight.description.blank?}
  end
  
  def discount
    
  end
  
  def savings
    
  end
end
