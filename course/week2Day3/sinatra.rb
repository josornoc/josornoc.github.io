require 'sinatra'
require 'sinatra/reloader'

set :port, 3000
set :bind, '0.0.0.0'

get '/say-my-name' do
	@name = "Jose Ignacio"
	erb :index
end