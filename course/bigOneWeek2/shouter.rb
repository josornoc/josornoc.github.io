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

class Shouter
	#god class needed?
end

class User < ActiveRecord::Base
	#handle must me implemented to be unique, without spaces
	#password (20 characters long and unique).

	#validation
  validates_presence_of :name, :handle, :password

  #relationships
  has_many :shouts
end

class Shout < ActiveRecord::Base

	#validates :name, length: { minimum: 2 }
  #validates :bio, length: { maximum: 500 }
  #validates :password, length: { in: 6..20 }
  #validates :registration_number, length: { is: 6 }
	#message at least 200 length
	#created_at, which is the moment when the SHOUT is saved (this behaviour must be implemented within the class, not outside).

	#validation
	validates :message, length: { maximum: 200 }
	validates_presence_of :created_at, :counter
	#validates_numericality_of , greater_than: -1

	#relationships
	belongs_to :user
end

#Driver code...
user = User.new
user.name = "Jose Ignacio"
user.password = "@josornoc"
user.save

#dynamic urls
get ('/') do
	# - We will have a main page where we can SHOUT. There will be a form in the top that takes care of that with a wide text field for the
	#   message, and an input button in order to SHOUT.
	@sList = Shout.all
	erb :index
end

get ('/best') do
	#which will show the SHOUTS sorted by the numberof likes.
	erb :best
end

get ('/:handle') do
	#shows all the SHOUTS from the user attached to that specific handle.
	#erb :handle?
end

post ('/new_shout') do
	#save new shout after validation
	d = DateTime.now
	shout = Shout.new(created_at:d,message:params[:message],counter:0)
	shout.save
	redirect('/')
end






