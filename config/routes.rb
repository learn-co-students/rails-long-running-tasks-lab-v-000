Rails.application.routes.draw do
  resources :artists, :songs

  get '/songs', to: 'songs#index'
  post '/songs/upload', to: 'songs#upload'
end
