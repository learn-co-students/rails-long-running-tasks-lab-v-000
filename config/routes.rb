Rails.application.routes.draw do

  post 'songs/upload', to: 'songs#upload'
  resources :artists, :songs
end
