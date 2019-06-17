Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :edit, :show]
  resources :artists, only: [:new, :edit, :show]

  post 'songs/upload', to: 'songs#upload'
end
