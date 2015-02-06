class ContactsController < ApplicationController
	def create
		@contact = Contact.new entry_params
		if @contact.save
			redirect_to root_path
		else
			render 'error'
		end
	end

	private
	def entry_params
		params.require(:contact).permit(:name, :address)
	end
end
