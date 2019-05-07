require 'stock_quote'

class StocksController < ApplicationController
	
	before_action :authenticate_user!
	before_action :authorized?
	


	def new
		@stock = Stock.new(params[:name])
	end


	def index
		@stock = Stock.all
	end


	def show
		@stock = Stock.find(params[:id])
	end


	def create
		@stock = Stock.new(stock_params)
		@stock  = Stock.stock_search(@stock.name)
		if @stock.save
			redirect_to @stock
		else
			render 'new'
		end
	end


	def destroy
		@stock = Stock.find(params[:id])
		@stock.destroy
		redirect_to stocks_path
	end


	private
	def stock_params
		params.require(:stock).permit(:name, :symbol, :user_account_id, :latest_price)
	end

	def authorized?
		if current_user.admin == false
			flash[:error] = "You are not authorized"
			redirect_to root_path
		end

	end
end
