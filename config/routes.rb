Rails.application.routes.draw do
  resources :artists, :songs
  
  resources :songs, only: [:index]
  post 'songs_controller/upload', to: 'songs_controller#upload'
end
