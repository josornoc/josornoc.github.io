Rails.application.routes.draw do
	get '/' => 'site#home'
	resources :projects do
		resources :entries
	end
end

# get '/' => 'site#home'
# get '/contact' => 'site#contact'
# get '/projects' => 'projects#index'
# get '/projects/:project_id' => 'projects#show'
# get '/projects/:project_id/entries' => 'entries#index', as: 'project_entries'
# post '/projects/:project_id/entries' => 'entries#create'
# get '/projects/:project_id/entries/new' => 'entries#new'
