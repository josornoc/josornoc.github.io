class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id]
		@entries = @project.entries
		#@entriesThisMonth = @project.entries_last_month
		@entriesThisMonth = @project.entries_by_year_and_month(Date.today.year, Date.today.month)
		@hoursWorked = 0
		@minutesWorked = 0
		@entriesThisMonth.each do |entry|
			@hoursWorked += entry.hours
			@minutesWorked += entry.minutes
		end
		@hoursWorked += (@minutesWorked.to_f / 60).round(2)
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
			flash[:notice] = "Entry created with honor"
			redirect_to action: 'index'
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
		render 'new'
	end

	def update
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
		if @entry.update_attributes entry_params
			redirect_to "/projects/" + @project.id.to_s + "/entries"
		else
			@errors	=	obj.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
		@entry.destroy
		@entry.save
		redirect_to "/projects/" + @project.id.to_s + "/entries"
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date, :comments)
	end
end











