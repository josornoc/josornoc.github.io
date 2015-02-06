class SiteController < ApplicationController
	def home
		@todayDate = Time.now.strftime("%d/%m/%Y")
		from = Date.today.midnight
		to = Date.today.midnight + 1.day
		finalDayMonth = Date.new(Date.today.year, Date.today.month, -1)
		@concertsToday = Concert.where(date:(from..to))
		@concertsRestOfMonth = Concert.where(date:(to..finalDayMonth))
		render 'index'
	end
end
