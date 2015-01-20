require 'pry'
require 'imdb'

class SearchImdb


  def search_length(movie)
    query = Imdb::Search.new(movie)
    query.movies.length
  end

  def most_seasons_from(movie)
    more_season = movie.map do |item|
      query = Imdb::Search.new(item).movies.first
      i = Imdb::Serie.new(query.id)
     
      [item, i.seasons.size]
    end
   more_season.sort_by{ |item| -item[1]}
   more_season[0][0]
  end

  def number_episodes(movie)

    more_episodes = movie.map do |item|
      query = Imdb::Search.new(item).movies.first
      i = Imdb::Serie.new(query.id)
      season = [*1 .. i.seasons.size]
      counter = 0
      season.map do |s| 
        counter += i.season(s).episodes.size
      end
      [item, counter]
    end
   result = more_episodes.sort_by{ |item| -item[1]}
   result[0][0]
  end

  def sort_rating(movie)
    movie_rating = movie.map do |item|
      query = Imdb::Search.new(item).movies.first
      i = Imdb::Serie.new(query.id)
      [item, i.rating]
    end
    rating = movie_rating.sort_by { |item| -item[1]}
    rating.map do |item|
      puts item[0] + " => " + item[1].to_s
    end
  end

  def top_x(n)
    top_rating = Imdb::Top250.new
    [*0 .. n - 1].map do |item|
      p top_rating.movies[item].title.gsub("\n","")
    end
  end
end


a = SearchImdb.new
#a.sort_rating(["Breaking Bad", "Friends", "Game of Thrones", "The Office"])
a.top_x(50)


# describe SearchImdb do 
#   before do 
#     @searching_imdb = SearchImdb.new
#   end

#   describe "search_length" do
#     it "takes a string and return the number of results for that search" do
#       expect(@searching_imdb.search_length("Cat")).to be > 50
#     end

#   end 

#   describe "most_seasons_from" do
#     it "return the TV shows with more seasons" do
#       expect(@searching_imdb.most_seasons_from(["Breaking Bad", "Friends", "Game of Thrones", "The Office"])).to eq("Friends")
#     end

#   end 

#   describe "number_episodes" do
#     it "returns the seasons ordered by number of episodes" do
#       expect(@searching_imdb.number_episodes(["Breaking Bad", "Friends", "Game of Thrones", "The Office"])).to eq("Friends")
#     end
#   end

#   describe "sort_rating" do
#     it "returns the best one using IMDB ratings" do
#       expect(@searching_imdb.sort_rating(["Breaking Bad", "Pacific Blue", "The Affair"])).to eq("Breaking Bad")
#     end
#   end

#   describe "top_x" do
#     it "return a hash with the top X movies following IMDB" do
#       expect(@searching_imdb.top_x(10).length).to eq(10)
#     end
#   end

# end

