Rails.application.routes.draw do
  root 'static_pages#home'
 
  # get 'static_pages/about' -> this takes you to http://www.example.com/static_pages/about
  # use a named route instead; access by about_path or about_url
  # help_path -> '/help'
  # help_url  -> 'http://www.example.com/help'
  get '/about', to: 'static_pages#about'
  get '/help', to:  'static_pages#help'
end
