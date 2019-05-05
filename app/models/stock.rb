class Stock < ApplicationRecord
	has_many :user_stocks
	has_many :users, through: :user_stocks

	def self.stock_search(symbol)
		begin
			stock = StockQuote::Stock.quote(symbol)
			#debugger
			new_stock = new(name: stock.company_name,
				symbol: stock.symbol,
				latest_price: stock.latest_price)
			new_stock
		#rescue Exception => e
			#return stock
		end
	end
end
