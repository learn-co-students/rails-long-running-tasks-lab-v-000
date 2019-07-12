Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists
  resources :songs
  resources :songs, only: [:index]
  post 'songs/upload', to: 'songs#upload'
  get 'songs/show', to: 'songs#show'
end
