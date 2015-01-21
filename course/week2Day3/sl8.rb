# SL8. The smallest IMDB web application ever

# Remember IMDB gem? Oh, it feels like last year since we used it. Shall we do it again? YES!

# Re-using some knowledge we already have on it, we will implement a small Sinatra web app that performs the following:
# 1. GET '/top250' lists the Top 250 movies names. If a "limit" parameter is set, then we limit the list to first "limit" results.
# 2. GET '/rating' will get the rating for a specific movie or TV show. If "id" is passed, we will use this "id" directly to fetch
# the movie or show. If "name" is passed instead, we will search for that name and get the first result. Also, if the rating is lower than 5,
# we will go to a '/warning' page directly, advising of the dangers of watching that movie/show.
# 3. GET '/info' will get all the information for a specific movie or TV show: name, year of release, cast members... you name it.
# Again, we will use "id" or "name" params to fetch it.
# 4. GET '/results' will get a "term" parameter, and will return the number of results for a search using that term.
# 5. GET '/now' will print the current date and time. Because sometimes it's useful.


require 'imdb'
require 'sinatra'
require 'sinatra/reloader'

set :port, 3003
set :bind, '0.0.0.0'


class SerieMaster

	def most_seasons_from(*series_names)
		tmpAry = series_names.map do |serie_name|
			 tmp_movie = Imdb::Search.new(serie_name).movies.first
			 Imdb::Serie.new(tmp_movie.id)
		end
		tmpAry = tmpAry.sort_by{|serie|serie.seasons.length}
		tmpAry.last.title
	end

	def compare_series(*series_names)
		tmpAry = series_names.map do |serie_name|
			 tmp_movie = Imdb::Search.new(serie_name).movies.first
			 Imdb::Serie.new(tmp_movie.id)
		end
		tmpAry = tmpAry.sort_by{|serie|serie.rating}
		tmpAry.last.title
	end

	def get_best_movies(nMovies)
		tmp_movie = Imdb::Top250.new.movies
		tmp_movie = tmp_movie.sort_by{|movie|movie.rating}
		puts tmp_movie 	
	end

	def get_movie(str)
		movie = Imdb::Search.new(str).movies.first
		return "No results found" if movie == nil
		"<h1> Movie Title:<br>" + movie.title + "</h1>"+
		"<h2> Movie Id:<br>" + movie.id + "</h2>" + 
		"<h3> Movie Rating:<br>" + eval_rating(movie.rating).to_s + "</h3>"
	end

	def get_movie_info(str)
		movie = Imdb::Search.new(str).movies.first
		return "No results found" if movie == nil
		"<h5> Movie Title:<br>" + movie.title + "</h5>"+
		"<img src="+movie.poster.to_s+"/>"+
		"<h6> Movie Id:<br>" + movie.company.to_s + "</h6>" + 
		"<h6> Movie Id:<br>" + movie.director.to_s + "</h6>" + 
		"<h6> Movie Id:<br>" + movie.year.to_s + "</h6>" + 
		"<h6> Movie Id:<br>" + movie.genres.to_s + "</h6>"
	end

	private
	def eval_rating(rating)
		return ("This movie/Tv Show sucks - its Rating is below 5 >>> " + rating.to_s) if rating < 5
		rating
	end
end

sm = SerieMaster.new

get '/top250' do
end

get '/rating' do
	if(params[:id].nil?)
		sm.get_movie(params["name"])
	else
		sm.get_movie(params["id"])
	end
end

get '/info' do
	if(params[:id].nil?)
		sm.get_movie_info(params["name"])
	else
		sm.get_movie_info(params["id"])
	end
end

get '/results' do
end

get '/now' do
end


