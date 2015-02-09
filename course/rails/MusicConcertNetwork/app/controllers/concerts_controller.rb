class ConcertsController < ApplicationController
	def index
		@concerts = Concert.all.reverse
	end
	def new
		@concert = Concert.new
	end
	def create
		@concert = Concert.new entry_params
		if @concert.save
			redirect_to action: 'index'
		else
			render 'error'
		end
	end
	def show
		@comment = Comment.new
		begin
			@concert = Concert.find(params[:id])
			@comments = @concert.comments.reverse
		rescue ActiveRecord::RecordNotFound
			render 'no_concerts_found'
		end
	end

	def price
		@concerts = Concert.where("price <= ?", params[:price])
		@price = params[:price]
	end

	def popular
		tomorrow = Date.today.midnight + 1.day
		#@concerts = Concert.where("date >= ?", tomorrow).reverse
		@concerts = Concert.joins(:comments).merge(Comment.where(:active => true))

		#@concerts = @concerts.joins(:comments).where("comments < ?", Time.now)
	end

	private
	def entry_params
		params.require(:concert).permit(:band, :venue, :city, :description, :date, :price)
	end
end











