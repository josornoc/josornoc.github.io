Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/:boo_url' => 'site#redirect'
end