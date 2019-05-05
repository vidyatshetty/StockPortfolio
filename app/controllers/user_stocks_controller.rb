class UserStocksController < ApplicationController
	def index
	end

	def new
		@user_stock = UserStock.new
	end

	def show
		@stock = Stock.find(params[:stock_id])
		@user_stock = @stock.user_stocks.find(params[:id])
	end


	def create
		@stock = Stock.find(params[:stock_id])
		si = params[:id]
		@user_stock = @stock.user_stocks.new(user_stock_params)
		@user_stock.save
		redirect_to @stock
	end

	private
	def user_stock_params
		params.require(:user_stock).permit(:user_id, :stock_id, :shares)
	end
end
