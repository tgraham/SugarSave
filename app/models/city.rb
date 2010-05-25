class City < ActiveRecord::Base
  attr_accessible :name, :state_id
  belongs_to :state
  
  validates :name,  :presence => true,
                    :uniqueness => true
  
  before_save :create_search_name
  
  def create_search_name
    self.search_name = self.name.downcase.gsub(/ /,'')
  end
end
