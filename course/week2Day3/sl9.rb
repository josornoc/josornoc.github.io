# SL9. Spotinatra Premium

# Now we will add some features to our awesome and shiny Spotinatra web app (exercise SL6, if you remember from today):
# * Instead of adding a song through "curl", we will create a form in the "/" route that allows us to create new song.
# * Instead of just printing the songs as a string, we will use an ERB template to do that, using the HTML <ul> and <li> elements.
# * Instead of just printing “ENOUGH”, we will use an ERB template to print an <h1> with “enough”
# * Instead of saving the songs in an array, we will create a SongList class that has one “add_song” method, which will take an author and a
# name as parameters, and add the information to the song list.

# Also, we will have a couple more features:
# * We will have a dynamic route, like "/artists/:artist" that, for the "artist" parameter, prints all the songs that we have from him/her
# in our songs list.
# * We will have a "/search" route that, with a "term" parameter, prints all the artists and the songs which match the "term" parameter.

# Enjoy!

require 'sinatra'
require 'sinatra/reloader'

set :port, 3000
set :bind, '0.0.0.0'

class SongList
	def initialize
		@songList = []
	end
	def add_song(name, artist)
		@songList << {:name => name, :artist => artist}
	end
	def to_s
		a = ""
		a << "<ul>"
		@songList.each do |song|
			a << "<li><b>" + "Name: </b>/" + song[:name] + " <b>Artist: </b>" + song[:artist] + "</li>"
		end
		a << "</ul>"
		a
	end
	def song_list_length?
		@songList.length
	end
	def song_list?
		@songList
	end
end

sl = SongList.new
visits ||= 0
songs ||= []

get '/' do
  visits += 1
  @visits = visits
  @songs = sl.song_list?
  erb :form
end

post '/save_song' do
  unless sl.song_list_length? > 9 
  	sl.add_song(params[:name], params[:artist])
  	redirect('/')
  end
  redirect('/enough')
end

get '/enough' do
  erb :enough
end





