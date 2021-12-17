Rails.application.routes.draw do
  root 'home#index'
  
  #search form
  post '/search', controller: 'home', action: 'find'

end