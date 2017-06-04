Rails.application.routes.draw do

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
  resources :users
  
  get '/signup', to: 'users#new'
end
