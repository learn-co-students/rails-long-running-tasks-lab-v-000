Rails.application.routes.draw do

  post '/songs/upload', to: 'songs#upload', as: 'songs_upload'
  resources :songs
  resources :artists

end
