Rails.application.routes.draw do
  get '/' => 'site#home'
	root :controller => 'static', :action => '/' 
  resources :contacts

  # resources :projects do
  #   resources :entries
  # end
  # resources :people
  # post '/people/:id' => 'people#add_project'
end
