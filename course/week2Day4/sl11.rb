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

class UserList
	attr_reader :userCollection
	def initialize
		@userCollection = []
	end
	def add_user(name, email)
		ucLength = @userCollection.length
		@userCollection << {id: ucLength, name: name, email: email}
		puts ucLength
	end
end

uList = UserList.new

get '/' do
	arCatImgsUrls = ["http://www.actitudfem.com/media/files/internet-famous-grumpy-cat-just-landed-an-endorsement-deal-with-friskies.jpg",
									 "http://sofunnypic.com/wp-content/uploads/2014/02/funny-cat-no-legs-They-fixed-you-The-Meta-Picture.jpg",
									 "http://www.actitudfem.com/media/files/internet-famous-grumpy-cat-just-landed-an-endorsement-deal-with-friskies.jpg",
									 "http://sofunnypic.com/wp-content/uploads/2014/02/funny-cat-no-legs-They-fixed-you-The-Meta-Picture.jpg",
									 "http://www.actitudfem.com/media/files/internet-famous-grumpy-cat-just-landed-an-endorsement-deal-with-friskies.jpg"]

	session[:catImgs] = arCatImgsUrls
	@userCollection = uList.userCollection
	@lastSignedUser = @userCollection.last[:name] if @userCollection.empty? == false
	erb :index
end

get '/cat' do
	@catImgs = session[:catImgs]
  erb :cats
end

post '/singup' do
	session[:id] = uList.add_user(params[:name], params[:email])
	redirect('/')
end




