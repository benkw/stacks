Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
 
  # get 'static_pages/about' -> this takes you to http://www.example.com/static_pages/about
  # use a named route instead; access by about_path or about_url
  # help_path -> '/help'
  # help_url  -> 'http://www.example.com/help'
  get '/about', to: 'static_pages#about'
  get '/help', to:  'static_pages#help'
  
  # resource routing declares index, show, new, edit, create, update and destroy actions
  # have to individually create each of the views: "show.html.erb" etc.
  # create the methods for each view (.html.erb) in the Users controller file with a method for each view
  # to view user 1, issue a GET request to /users/1
  # the RESTful URLs ensure a POST request to /users is handled by the create action
  resources :users
  
  # the signup page /signup is routed to the new action in the Users controller
  get '/signup', to: 'users#new'
  
  # make a submitted and unsubmitted signup form use the same custom named route
  post '/signup', to: 'users#create'

  # we do not need the full suite of RESTful routes for the Sessions resource
  # session resource uses only named routes 
  # GET and POST requests through login route
  # DELETE request through logout route
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
