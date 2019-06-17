Rails.application.routes.draw do
  resources :songs
  resources :artists, only: [:show]
  post 'songs/upload', to: 'songs#upload'
end
