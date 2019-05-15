Rails.application.routes.draw do
  resources :songs
  resources :artists
  post 'songs/upload', to: 'songs#upload'
end
