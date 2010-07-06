class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :transaction_id
      t.integer :amount
      t.integer :number
      t.boolean :settled

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
