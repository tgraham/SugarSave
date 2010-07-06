class Invoices < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :user

  validates :amount, :number, :user_id, :presence => true
  validates :amount, :number, :numericality => true

  composed_of :amount, :class_name => "Money", :mapping => [ %w(amount cents) ]

  def process
    if not self.id
      return false
    end
    
    t = Transaction.create({:invoice_id => self.id})
    t.save

    self.transaction = t
      
    if t.process
      update_attributes({:settled => true})
      
      return true
    else
      update_attributes({:settled => false})
      
      return false
    end
  end
  
end
