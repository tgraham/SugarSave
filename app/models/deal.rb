class Deal < ActiveRecord::Base
  attr_accessible :name, :description, :regular_price, :initial_discount, :max_discount, :max_threshold, :deal_date, :city_id, :company_id
  belongs_to :company
  belongs_to :city
end
