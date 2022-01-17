class ChangeUsersColums < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :password, :password_digest
    change_column :users, :email, :string, null: false
  end
end
