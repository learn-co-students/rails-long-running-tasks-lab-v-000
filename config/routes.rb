Rails.application.routes.draw do
  resources :artists
  resources :songs

  resources :songs, only: [:index]
  post 'songs/upload', to: 'songs#upload'
end
