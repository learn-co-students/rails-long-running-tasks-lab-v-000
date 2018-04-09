Rails.application.routes.draw do
  resources :artists, :songs
  post 'upload' => 'songs#upload'
end
