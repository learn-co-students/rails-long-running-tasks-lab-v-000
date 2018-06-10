Rails.application.routes.draw do
  resources :artists, :songs
  post 'songs_upload' => 'songs#upload'
end
