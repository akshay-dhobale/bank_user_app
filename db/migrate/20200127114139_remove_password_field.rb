class RemovePasswordField < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :password_digest
  	remove_column :users, :last_login
  end
end
