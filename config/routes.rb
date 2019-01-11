Rails.application.routes.draw do
  resources :artists, :songs
   post 'songs/upload' => 'songs#upload', as: :songs_upload
end
