Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'secrets/new'
  #
  #   root 'application#hello'
     post '/upload' => 'songs#upload', as: 'songs_upload'
     resources :songs
     resources :artists
  #   post '/logout' => 'sessions#destroy'
  #
  #   get '/secret' => 'secrets#show'
end
