class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.string :gist_url
      t.references :owner, null: false, foreign_key: {to_table: :users} 

      t.timestamps
    end
  end
end
