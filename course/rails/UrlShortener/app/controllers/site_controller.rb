class SiteController < ApplicationController
	def home
		@allShortenedUrls = Shortenedurl.all
		render 'home'
	end

	def redirect
		@allShortenedUrls = Shortenedurl.all
		render 'home'
	end
end