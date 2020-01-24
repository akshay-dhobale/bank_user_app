class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.string :account_number, null: false
      t.float :balance, default: 0

      t.timestamps
    end
  end
end
