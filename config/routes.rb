Rails.application.routes.draw do
  resources :users
  resources :attractions

  post '/rides/new', :to => "rides#new"

  get '/signin', :to => "users#signin"
  post '/logged_in', :to => "users#logged_in"
  post '/signout', :to => "users#signout"

  root :to => "welcome#home"

end
