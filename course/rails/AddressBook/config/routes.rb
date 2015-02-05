Rails.application.routes.draw do
  get '/' => 'site#home'
  resources :contacts

  # resources :projects do
  #   resources :entries
  # end
  # resources :people
  # post '/people/:id' => 'people#add_project'
end
