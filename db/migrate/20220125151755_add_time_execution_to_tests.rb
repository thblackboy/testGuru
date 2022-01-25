class AddTimeExecutionToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_execution, :integer, null: false, default: 5
  end
end
