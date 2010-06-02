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
  
  def order_count
    counted = 1
    counted < self.max_threshold ? counted : self.max_threshold
  end
  
  def initial_discount_price
    self.regular_price-(self.regular_price*(self.initial_discount.to_f/100))
  end
  
  def max_discount_price
    self.regular_price-(self.regular_price*(self.max_discount.to_f/100))
  end
  
  def each_discount
    (self.initial_discount_price-self.max_discount_price)/self.max_threshold
  end
  
  def current_price
    price = self.initial_discount_price-(self.order_count*self.each_discount).round(2)
    price = price.to_i if price == price.to_i
    price
  end
  
  def discount_percent
    (1-(self.current_price/self.regular_price.to_f))*100
  end
  
  def savings
    saved = (self.regular_price.to_f-self.current_price).round(2)
    saved = saved.to_i if saved == saved.to_i
    saved
  end
end
