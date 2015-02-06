Rails.application.routes.draw do
  root 'site#home'
  resources :concerts do
  	resources :comments
	end
  #post '/people/:id' => 'people#add_project'
end