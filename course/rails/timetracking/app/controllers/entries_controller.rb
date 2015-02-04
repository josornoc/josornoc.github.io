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
	end

	def new
		#vars for new.html.erb
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end
end
