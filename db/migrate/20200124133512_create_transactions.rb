class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :type
      t.string :transaction_id
      t.float :amount
      t.integer :status
      t.float :balance
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
