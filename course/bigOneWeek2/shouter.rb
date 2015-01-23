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
	@user = User.find_by_id(session[:current_user])
	@sList = Shout.all.reverse
	@errors = session[:errors]
	erb :index_login
end

get ('/best') do
	@sList = Shout.all.sort_by{|shout|shout.likes}.reverse
	erb :best
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

get ('/error') do
	puts "User is nil"
end

post ('/new_shout') do
	if user = User.find_by_handle(params[:handle])
		user.shouts.create(created_at:DateTime.now,message:params[:message],likes:0)
		redirect('/')
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

post ('/log_in') do
	user = User.find_by_handle(params[:handle])
	if user.nil? == false
		if(user.password == params[:password])
			@errors = session[:errors] = nil
			session[:current_user] 
			session[:current_user] = user.id
			redirect('/'+user.handle)
		else
			session[:errors] = "Wrong password for user"
			redirect('/')
		end
	else
		session[:errors] = "No users found with that handle"
		redirect('/')
	end
end

post ('/log_out') do
	session[:current_user] = 0
	redirect('/')
end
















