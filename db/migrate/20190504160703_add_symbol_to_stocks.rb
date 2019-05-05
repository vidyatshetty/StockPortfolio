class AddSymbolToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :symbol, :string
  end
end
