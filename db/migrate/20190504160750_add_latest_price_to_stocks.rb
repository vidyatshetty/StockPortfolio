class AddLatestPriceToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :latest_price, :integer
  end
end
