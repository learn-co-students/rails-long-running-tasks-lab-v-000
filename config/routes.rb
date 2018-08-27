Rails.application.routes.draw do
  resources :artists, :songs
  post 'songs/upload', to: 'songs#upload'
  #post 'customers/upload', to: 'songs_controller#upload'
end
