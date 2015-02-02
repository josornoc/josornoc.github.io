class ProjectsController < ApplicationController
	def index
		@yMama = "your mama"
		@projects = Project.last_created_projects(10)
	end	
end

