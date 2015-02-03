class ProjectsController < ApplicationController
	def index
		@yMama = "your mama"
		#@projects = Project.last_created_projects(10)
		#@projects = []
		@projects = Project.all
		if(@projects.empty?)
			render 'no_projects'
		end
	end	
	def show
		begin
			@project = Project.find(params[:project_id])
		rescue ActiveRecord::RecordNotFound
			render 'no_projects_found'
		end
	end
end

