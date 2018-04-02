Rails.application.routes.draw do
  resources :artists
  resources :songs do
    post 'upload', on: :collection
  end
end
