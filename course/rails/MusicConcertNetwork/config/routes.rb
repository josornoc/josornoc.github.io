Rails.application.routes.draw do
  root 'site#home'
  get '/price' => 'concerts#price'
  get '/concerts/popular/' => 'concerts#popular'
  resources :concerts do
  	resources :comments
  end
end