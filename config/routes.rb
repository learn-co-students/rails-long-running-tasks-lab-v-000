Rails.application.routes.draw do
  resources :songs
  resources :artists
  get 'songs/upload', to: 'songs#upload'
  post 'songs/upload', to: 'songs#upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
