# SL2. I’m damn right about TV series!

# I love TV series. I hope you do too. One of the main topics about TV series is The Absolute Truth Answers, which everyone thinks
# he has but no one truly does.

# Is Lost Finale as shitty as everyone says? Is The Wire the best TV series ever, or is it Breaking Bad? WHY WAS FIREFLY CANCELLED?
# Is it true that whoever wrote Heroes season 3 was the Devil himself? Why is Community so underrated, being in fact the best comedy ever?

# Write a class, let’s say SeriesMasterOfTheUniverse, with several methods answering questions about the series universe. Try to add
# parameters to most questions: there is no point in testing constants! Then add the testing for it using RSpec. Write several tests
# for each question, exploring different scenarios.

# An example of a method is one that, when passing a list of some TV series, returns the best one. For instance, when prefering The Wire
# when comparing it to Friends, it should pass the test. Otherwise, if it returns Mom as the best comedy aired on 2013, it should fail
# (I mean, Veep or Community were definitely better).

# Upgrade: use IMDB Ruby gem to remove arbitrarity!

require 'imdb'
require 'awesome_print'

class SeriesMasterOfTheUniverse
	def compare_serie(*movie_titles)
		movie_titles.map do |movie_title|
			Imdb::Search.new(movie_title).movies.first
		end.sort do |movie|
			movie.rating
		end.first.title
	end	
	def get_best_movie_of_actor(actor_name)

		# anm = Imdb::Search.new(actor_name).movies
		# anm = anm.sort_by{|movie|movie.rating}
		# anm = anm.first(3)
		# anm.each do |movie|
		# 	puts movie.title
		# 	puts movie.year
		# 	puts movie.rating
		# end

		movie_actor_list = Imdb::Search.new(actor_name).movies
		movie_actor_list = movie_actor_list.sort_by{|movie|movie.rating}
		movie_actor_list = movie_actor_list.first(15)
		movie_actor_list.each do |movie|
			puts movie.title
			puts movie.year
		end
	end

	def by_year(year)
		movie_actor_list = Imdb::Search.new(year).movies
	end
end

SeriesMasterOfTheUniverse.new.get_best_movie_of_actor("Al Pacino")




# describe SeriesMasterOfTheUniverse do

# 	before do
# 		@seriesMasterOfTheUniverse = SeriesMasterOfTheUniverse.new
# 	end

# 	describe "#compare_serie" do
# 		it "should say the breaking bad is better than friends" do
# 			sComparison = @seriesMasterOfTheUniverse.compare_serie("Friends", "Breaking Bad")
# 			expect(sComparison).to eq("Breaking Bad (2008) (TV Series)")
# 		end
# 		it "should say the breaking bad is better than twin peaks and the sopranos" do
# 			sComparison = @seriesMasterOfTheUniverse.compare_serie("Twin Peaks", "The Sopranos", "Breaking Bad")
# 			expect(sComparison).to eq("Breaking Bad (2008) (TV Series)")
# 		end
# 		it "should say that heroes is better than lost" do
# 			sComparison = @seriesMasterOfTheUniverse.compare_serie("Lost", "Heroes")
# 			expect(sComparison).to match(/Héroes/)
# 		end
# 		it "should say that interstellar is better than gravity" do
# 			sComparison = @seriesMasterOfTheUniverse.compare_serie("Gravity", "Interstellar")
# 			expect(sComparison).to match(/Interstellar/)
# 		end
# 	end
# end













