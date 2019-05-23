Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'songs', to: 'songs#index'
  post 'songs/upload', to: 'songs#upload'
  get 'songs/new', to: 'songs#new'

  resources :songs, only: [:show, :edit]
  resources :artists, only: [:show]
end
