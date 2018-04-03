Rails.application.routes.draw do
  resources :artists, :songs
  # a route to take the file upload
  post 'songs/upload', to: 'songs#upload'
end
