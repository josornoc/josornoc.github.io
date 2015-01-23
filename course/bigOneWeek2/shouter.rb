require 'rubygems'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

enable :sessions
set :port, 3000
set :bind, '0.0.0.0'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

class User < ActiveRecord::Base
	#password (20 characters long and unique).
	#validation
  validates_presence_of :name, :handle, :password

  #relationships
  has_many :shouts

  private
  #specific validations
	#handle must me implemented to be unique, without spaces
end

class Shout < ActiveRecord::Base
	#validation
	validates :message, length: { maximum: 200 }
	validates_presence_of :created_at, :likes
	
	#relationships
	belongs_to :user
end

#dynamic urls
get ('/') do
	# - We will have a main page where we can SHOUT. There will be a form in the top that takes care of that with a wide text field for the
	#   message, and an input button in order to SHOUT.
	@sList = Shout.all.reverse
	@uList = User.all
	erb :index
end

get ('/best') do
	#which will show the SHOUTS sorted by the numberof likes.
	@sList = Shout.all.sort_by{|shout|shout.likes}.reverse
	erb :best
end

post ('/new_shout') do
	if user = User.find_by_handle(params[:handle])
		user.shouts.create(created_at:DateTime.now,message:params[:message],likes:0)
		redirect('/')
	else
		redirect('/error')
	end
end

get ('/error') do
	puts "User is nil"
end

get ('/:handle') do
	#shows all the SHOUTS from the user attached to that specific handle.
	if user = User.find_by_handle(params[:handle])
		@sList = user.shouts.sort_by{|shout|shout.created_at}.reverse
		erb :handle
	else
		redirect('/error')
	end
end

post ('/new_user') do
	#save new shout after validation
	newPass = (0...20).map { ('a'..'z').to_a[rand(26)] }.join
	newUser = User.new(name:params[:name],handle:params[:handle],password:newPass)
	newUser.save
	redirect('/')
end

post ('/add_like') do
	#save new shout after validation
	shout = Shout.find_by_id(params[:shout_id])
	shout.likes += 1
	shout.save
	redirect('/')
end
















