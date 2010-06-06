class AddDealIdToRecommendation < ActiveRecord::Migration
  def self.up
    add_column :recommendations, :deal_id, :integer
    add_column :recommendations, :name, :string
  end

  def self.down
    remove_column :recommendations, :name
    remove_column :recommendations, :deal_id
  end
end
