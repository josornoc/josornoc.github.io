Rails.application.routes.draw do
  # get '/' => 'site#home'
  root 'site#home'
  resources :concerts

  # resources :projects do
  #   resources :entries
  # end
  #resources :people
  #post '/people/:id' => 'people#add_project'

end