# SL11. Valid students are valid students

# You loved the exampled about students, huh? Let’s student you up then!

# We just have a really nice student class, but we are worried that our dog adds some typo into it, so we wanna be sure that we can check it’s working as we want it to, automagically.

# How could we do that? Let me think…

# OH, YEAH! TESTING!

# So we are going to do some nice testing and implementation on this Student class with the following:
# 1. First, add tests for each one of the validations we have. Check that if we don’t have a name for a student then the student is not valid,
# same for surnames; also check that if we have an 11 year old student we won’t accept him (yet), and so on.
# 2. Add a “complete_name” method, but with the help of TDD. Remember: add the tests about the behaviour, then the tests will fail, and
# finally just implement the method and all tests will pass again.
# 3. Once all the specs pass add some more validations of your own. For example, we won’t accept students born before 1970 that have more
# than one dog, and we also won’t accept students which have “Xavier” name, because we want him to be the only Xavier in Ironhack <3 (repeat
# the same with “Nick”, because we love him starting at us doing yoga)
# 4. Finally, remove all the ActiveRecord validations and implement them on your own with the “validate” DSL method. Let’s go, folks!
# Note: you will find a student.rb template file and the student.sqlite database in Slack.

require 'sinatra'
require 'sinatra/reloader'

enable :sessions
set :port, 3000
set :bind, '0.0.0.0'

ActiveRecord :: Base.stablish_connection(
	adapter: 'sqlite3',
	database: 'students.sqlite'
)

class UserList < ActiveRecord::Base
end

uList = UserList.new

#init vars here...

get '/' do
  visits += 1
  @userList = visits
  @songs = sl.song_list?
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











