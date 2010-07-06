class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :invoice_id
      t.string :confirmation_id
      t.boolean :error
      t.string :error_code
      t.string :error_message

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
