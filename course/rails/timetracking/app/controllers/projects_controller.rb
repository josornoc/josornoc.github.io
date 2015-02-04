class ProjectsController < ApplicationController
	def index
		@yMama = "your mama"
		#@projects = Project.last_created_projects(10)
		#@projects = []
		@projects = Project.all.reverse
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
	def new
		@project = Project.new
	end
	def create
		@project = Project.new entry_params
		if @project.save
			redirect_to action: 'index'
		else
			render 'new'
		end
	end

	private
	def entry_params
		params.require(:project).permit(:name, :description)
	end
end

