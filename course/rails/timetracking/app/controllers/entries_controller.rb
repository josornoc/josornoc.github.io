class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id]
		@entries = @project.entries
		#@entriesThisMonth = @project.entries_last_month
		@entriesThisMonth = @project.entries_by_year_and_month(2015, 2)
		@hoursWorked = 0
		@minutesWorked = 0
		@entriesThisMonth.each do |entry|
			@hoursWorked += entry.hours
			@minutesWorked += entry.minutes
		end
		@hoursWorked += @minutesWorked / 60
	end

	def new
		#vars for new.html.erb
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end

	def create
		@project = Project.find params[:project_id]
		@entry = @project.entries.new entry_params
		if @entry.save
			redirect_to action: 'index'
		else
			render 'new'
		end
	end

	private
	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date, :comments)
	end
end
