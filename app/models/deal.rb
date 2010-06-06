class Deal < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "320x250>", :thumb => "128x100>" },
                    :url => "/assets/deals/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/deals/:id/:style/:basename.:extension"
  
  attr_accessible :name, :blurb, :blurb_title, :regular_price, :initial_discount, :max_discount, :max_threshold, 
                  :deal_date, :city_id, :company_id, :approved, :fine_prints_attributes, :highlights_attributes,
                  :photo, :photo_file_name, :weekend, :deal_type, :tipping_point
                  
  belongs_to :company
  belongs_to :city
  
  has_many :fine_prints, :dependent => :destroy
  has_many :highlights, :dependent => :destroy
  has_many :recommendations
  
  accepts_nested_attributes_for :fine_prints, :reject_if => lambda { |a| a[:description].blank? }
  accepts_nested_attributes_for :highlights, :reject_if => lambda { |a| a[:description].blank? }
  
  DEAL_TYPE = %w[Flat Slider Tipping]
  
  after_update :remove_empty_fine_prints
  after_update :remove_empty_highlights
  
  def remove_empty_fine_prints
    fine_prints.delete fine_prints.select{ |fine_print| fine_print.description.blank?}
  end
  
  def remove_empty_highlights
    highlights.delete highlights.select{ |highlight| highlight.description.blank?}
  end
  
  def order_count
    counted = 25
    if self.deal_type == 'Slider'
      counted < self.max_threshold ? counted : self.max_threshold
    else
      counted
    end
  end
  
  def ordered_percent
    ((self.order_count/self.tipping_point.to_f)*100).to_i
  end
  
  def orders_to_go
    self.tipping_point - self.order_count
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
    self.initial_discount_price-(self.order_count*self.each_discount)
  end
  
  def discount_percent
    (1-(self.current_price/self.regular_price.to_f))*100
  end
  
  def savings
    self.regular_price-self.current_price
  end
  
  def flat_savings
    self.regular_price*(self.initial_discount.to_f/100)
  end
end
