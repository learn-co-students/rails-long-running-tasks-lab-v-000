Rails.application.routes.draw do
  resources :artists, :songs
  
  # For Upload Feature
  post 'songs/upload', to: 'songs#upload'

end
