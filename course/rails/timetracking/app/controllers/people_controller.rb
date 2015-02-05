class PeopleController < ApplicationController
	def index
		@people = Person.all.reverse
		if(@people.empty?)
			render 'no_people'
		end
	end
	def new
		@person = Person.new
	end
	def show
		begin
			@person = Person.find(params[:id])
			@projects = Project.all.reverse
			@prjsForSelection = @projects.each.map{|x|[x.name, x.id]}
		rescue ActiveRecord::RecordNotFound
			render 'no_people_found'
		end
	end
	def create
		@person = Person.new entry_params
		if @person.save
			redirect_to action: 'index'
		else
			render 'new'
		end
	end

	def add_project
		@person = Person.find(params[:id])
		@project = Project.find(params[:project_id])
		if @person.save
			@person.projects << @project
			redirect_to action: 'index'
		else
			render 'show'
		end
	end

	private
	def entry_params
		params.require(:person).permit(:name)
	end
end







