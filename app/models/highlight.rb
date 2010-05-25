class Highlight < ActiveRecord::Base
  attr_accessible :description, :deal_id
  belongs_to :deal
end
