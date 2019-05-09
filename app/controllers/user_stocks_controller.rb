class UserStocksController < ApplicationController
	before_action :authenticate_user!
	before_action :authorized?, except: [:index]

	def index
		@userid = User.find(params[:user_id])
		if current_user[:id] == @userid.id
			@user_stock = current_user.user_stocks.all
		else
			flash[:error] = "You are not authorized"
			redirect_to root_path
		end
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
	def authorized?
		if current_user.admin == false
			flash[:error] = "You are not authorized"
			redirect_to root_path
		end
	end
end
