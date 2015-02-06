class CommentsController < ApplicationController
	def create
		@concert = Concert.find params[:concert_id]
		@comment = @concert.comments.new entry_params
		if @comment.save
			flash[:message] = "Comment created with honor"
			redirect_to "/concerts/" + @concert.id.to_s
		else
			render 'error'
		end
	end

	private
	def entry_params
		params.require(:comment).permit(:name, :text)
	end
end

	