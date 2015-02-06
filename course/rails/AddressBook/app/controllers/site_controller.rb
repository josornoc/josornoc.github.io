class SiteController < ApplicationController
	def home
		@contacts = Contact.all.reverse
		@contact = Contact.new
	end
end
