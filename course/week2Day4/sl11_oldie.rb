# SL11. The big user brother

# Drones for everything. Control. 1984. Like the novel? No, reality! We are constantly being watched, so at least brush your hair perfectly!

# The thing is, some an activist hacker organization hires you to design a platform were everyone can sign up and, more importantly,
# ¡everyone can see everyone! If the government has this power, everyone should!

# So. Implement a Sinatra web application where:
# - In “/“, you can see the list of users (showing their name) that have signed up and the number of users.
# - Also in “/“, there’s a form (pointing to “/signup”) with which you can sign up yourself. After you sign up, your user id (and your
# id only) is saved in session, and you can see it in the top (hint: use an internal data structure were you can save 
# ids with their corresponding names and, important: ids should be incremental and not repeat).
# - There also a “/cats” page, linked from “/“, with five pictures of cats of your choice. Do your best!


require 'sinatra'
require 'sinatra/reloader'

enable :sessions
set :port, 3000
set :bind, '0.0.0.0'

# ActiveRecord :: Base.stablish_connection(
# 	adapter: 'sqlite3',
# 	database: 'students.sqlite'
# )
# class UserList < ActiveRecord::Base
# 	###
# end
# uList = UserList.new

#init vars here...
get '/' do
  # visits += 1
  # @userList = visits
  # @songs = sl.song_list?

  erb :index
end

get '/enough' do
  erb :enough
end

# get '/artist/:artist' do
# 	@songs = sl.song_list?
# 	@artist = params[:artist]
# 	erb :artist
# end

# get '/search' do
# 	if @sResults.nil? != false || @sResults.empty? == false
# 		@sResults = sl.search_results?
# 	else
# 		@sResults = "No results"
# 	end
# 	sl.reset_search_results
# 	erb :search
# end

######### Post methods
# post '/save_song' do
#   unless sl.song_list_length? >= 9 
#   	sl.add_song(params[:name], params[:artist])
#   	redirect('/')
#   end
#   redirect('/enough')
# end

# post '/search_term' do
#   unless sl.song_list_length? == 0
#   	sl.get_search_results(params[:term])
#   end
#   redirect('/search')
# end










