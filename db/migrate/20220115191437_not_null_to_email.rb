class NotNullToEmail < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email, :string, null: false
  end
end
