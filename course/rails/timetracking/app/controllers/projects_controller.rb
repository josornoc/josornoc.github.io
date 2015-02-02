class ProjectsController < ApplicationController
	def index
		@yMama = "your mama"
		@projects = Project.last_created_projects(10)
		@projects = []
		if(@projects.empty?)
			render 'no_projects'
		end
	end	
	def show
		begin
			@project = Project.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render 'no_projects_found'
		end
	end
end

