class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :user_account_id

      t.timestamps
    end
  end
end
