class SiteController < ApplicationController
	def home
		@allShortenedUrls = Shortenedurl.all
		render 'home'
	end

	def redirect
		@allShortenedUrls = Shortenedurl.limit(3)
		render 'home'
	end
end