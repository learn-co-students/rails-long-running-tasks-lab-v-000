Rails.application.routes.draw do
  resources :artists, :songs
  # songs_controller#upload   
  post 'songs/upload', to: 'songs#upload'
end
