Rails.application.routes.draw do
  resources :artists, :songs
   post 'artists/upload', to: 'artist#upload'
  post 'songs/upload', to: 'songs#upload'
end
