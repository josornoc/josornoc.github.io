class SiteController < ApplicationController

	def home
		@contacts = Contact.all.reverse
		@contact = Contact.new
	end
	def create
		@contact = Contact.new entry_params
		redirect_to action: 'home'
	end

	private
	def entry_params
		params.require(:contact).permit(:name, :address)
	end
end
