# SL3. More TDD (I mean, TV) series!

# Tired of the discussion between Sopranos vs The Wire? Hint: watch True Detective, House of Cards or Breaking Bad, and we’ll talk later.
# Are you tired of watching Friends for the 254th time? Well, I wouldn’t recommend How I Met Your Mother too much but… how about tech? Check
# out Halt & Catch Fire (AMC) or Silicon Valley (HBO)! Anyway, wake up, we are tired and it’s Monday, but you don’t want to look like
# someone from The Walking Dead, right?

# Let’s enlarge SL2 but with a change. Until now, we used our beliefs for the returning values of the methods. This time, though, we will
# use real information from one site called IMDB, which turns out to have a nice and fun API. And this time, instead of writing the
# tests afterwards, we will write them first hand. Let’s go do some nice TDD!

# The first method will take a string as a parameter (for example, ‘Cat’) and return the number of results for that search in IMDB. For
# ‘Cat’, it’s more than 200 examples! That’s a lot of cats indeed!

# The second method will be similar to “best_within”… but instead of returning the best one based on the rating, it will return the one
# with most seasons! We will call this method “most_seasons_from”. Example: we call the method with the following TV series: Breaking Bad
# (5 seasons), Friends (10 seasons), Game of Thrones (6 seasons: they renewed for two more!) and The Office (9 seasons). It should return Friends!
# And this way we'll be able to know which show will make us more socially missing, too.

# The third method will be similar to "most_seasons_from", but instead of having the season into account, it will have the number of episodes
# into account.

# The four method will be a comparator (it might turn into our best friend!). It will take an array of strings, each one being
# the name of a TV show, and it will return the best one using IMDB ratings. For example, if we pass Breaking Bad, Pacific Blue (oh, those
# times!) and The Affair, it will return Breaking Bad (although The Affair is really good, and just won a Golden Globe, even when Golden Globes
# are worthless).

# The fifth and final method will get an integer argument, let's call it X, and will return a hash with the top X movies following IMDB
# rating, including it too. The integer argument should be between 1 and 250, and the returned hash should look like:
# {
#   'Shawsank Redemption' => 9.2,
#   'The Godfather' => 9.2,
#   'The Godfather II' => 9.0,
#   'The Dark Knight' => 8.9,
#   ...and so on until having X movies
# }

# ============================================================
# AND REMEMBER, WE WANT TDD. TESTS FIRST, THEN IMPLEMENTATION.
# ============================================================

# Note: if you grab results from Imdb::Search, it will always return a Imdb::Movie object, not Imdb::Serie. In order to get info an Imdb::Serie,
# which has information like the number of episodes, just use the id to fetch the serie directly:
#   dexter_movie = Imdb::Search.new(‘Dexter’).movies.first
#   dexter_serie = Imdb::Serie.new(dexter_movie.id)


require 'imdb'

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
end



describe SerieMaster do

	before do
		@master = SerieMaster.new
	end

	describe "#most_seasons_from" do
		it "should return The Simpsons" do
			expect(@master.most_seasons_from("Friends", "It's Always Sunny in Philadelphia", "House of Cards", "Prison Break", "The Simpsons")).to match(/The Simpsons/)
		end
	end

	describe "#compare_series" do
		it "should return The Wire" do
			expect(@master.compare_series("House of Cards", "Orange is the New Black","The Wire")).to match(/The Wire/)
		end
		# it "should return Breaking Bad" do
		# 	expect(@master.compare_series("House of Cards", "Orange is the New Black", "Breaking Bad", "The Wire")).to match(/Breaking Bad/)
		# end
	end

	describe "#get_best_movies" do
		it "should return a really nice object with name and rating" do
			expect(@master.get_best_movies(3)).to match(/Breaking Bad/)
		end
	end
end








