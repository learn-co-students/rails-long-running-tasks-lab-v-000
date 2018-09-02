Rails.application.routes.draw do
  resources :artists, :songs
  post 'song/upload', to: 'songs#upload'
end
