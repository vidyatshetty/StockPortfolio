class UserStocksController < ApplicationController
	before_action :authenticate_user!

	def index
		@userid = User.find(params[:user_id])
		@user_stock = @userid.user_stocks.all
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
		@user_stock = @stock.user_stocks.new(user_stock_params)
		if @user_stock.save
			redirect_to @stock
		else
			render 'new'
		end
	end

	private
	def user_stock_params
		params.require(:user_stock).permit(:user_id, :stock_id, :shares)
	end
end
