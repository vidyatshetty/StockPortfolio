class Stock < ApplicationRecord
	has_many :user_stocks, dependent: :destroy
	has_many :users, through: :user_stocks
	#validates :name, presence: true
	#validates :name, uniqueness: true

	def self.stock_search(symbol)
		begin
			stock = StockQuote::Stock.quote(symbol)
			#debugger
			new_stock = new(name: stock.company_name,
				symbol: stock.symbol,
				latest_price: stock.latest_price)
			new_stock
			#return stock
		end
	end
end
