Rails.application.routes.draw do
  resources :artists, :songs
  post 'upload/songs', :to => "songs#upload"
end
