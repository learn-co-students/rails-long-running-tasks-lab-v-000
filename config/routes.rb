Rails.application.routes.draw do
  root 'songs#index'
  resources :artists, :songs
  post 'songs/upload', to: 'songs#upload'
end
