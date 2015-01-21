# SL6. Spotinatra

# In the times of Frank Sinatra, there was no Spotify. People had to see him live, or listen to him through a timetable. Can you imagine to
# live in a time like that? At least there was no Justin Beiber! :)

# Anyway, we woke up today with the strong will of telling Frank Sinatra how music is these days. It would be weird to go to his grave and
# tell him, so we will implement a little web application with Sinatra.

# This web application will have three different routes. The first one will be in the home (‘/‘), will be GET, and will list the songs that
# we have sent to our web application. In the beginning, it will be empty, so nothing will be printed out.

# The second one will be ‘/songs/new’, will be POST, and will have both “name” and “artist” parameters. This will add a new song to our
# internal list of songs, and redirect to home (the first route).

# Finally, when we have sent 10 songs to the system through the second route, instead of being redirected to home, we will be redirected to
# a third route, called ‘/enough’, that shows a warning message, crafted by Sinatra himself, staging that current music, and I quote,
# “IS WORTH F***ING NOTHING”*.

# * I am not responsible from Sinatra words. I mean, he said it in his way.

require 'sinatra'
require 'sinatra/reloader'

set :port, 3003
set :bind, '0.0.0.0'

class SongList
	def initialize
		@songList = []
	end
	def add_song(name, artist)
		@songList << {:name => name, :artist => artist}
	end
	def to_s
		@songList.to_s
	end
	def song_list_length?
		@songList.length
	end
end

sl = SongList.new

get '/' do
	sl.to_s
end

post '/songs/new' do
	sl.add_song(params["name"],params["artist"])
	if sl.song_list_length? >= 10
		redirect('/enough')
	end
end

get '/enough' do
	'Warning message from F. Sinatra: These songs ' + sl.to_s + ' Are worth f!%() nothing...'	
end


#curl -X POST "localhost:3003/songs/new?name="Jose"&artist="Ignacio"
#curl -X POST 'localhost:3003/songs/new' --data "name=Jose Ignacio,artist=Some artist name"
#curl -L -X POST 'localhost:3003/songs/new' --data "name=JoseIgnacio,artist=SomeArtistName"
#curl -L --data "name=JoseIgnacio&artist=SomeArtistName" 'localhost:3003/songs/new' 





