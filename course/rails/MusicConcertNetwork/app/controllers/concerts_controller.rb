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
		begin
			@concert = Concert.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render 'no_concerts_found'
		end
	end
	private
	def entry_params
		params.require(:concert).permit(:band, :venue, :city, :description, :date, :price)
	end
end
