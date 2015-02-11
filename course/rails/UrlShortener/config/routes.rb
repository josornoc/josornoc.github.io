Rails.application.routes.draw do

  get '/' => 'site#home'
  root :controller => 'site', :action => 'redirect' 

  #get '/:boo_url' => 'static', :action => 'site#redirect'
  #get '/:boo_url' => 'site#redirect'
  #get '/:boo_url' => 'site#redirect'
	#root '/:boo_url' => 'static', :action => '/' 

end