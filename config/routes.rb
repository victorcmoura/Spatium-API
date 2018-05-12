Rails.application.routes.draw do
  resources :file_objects
  resources :builds
  get '/file_objects/:id/:filename', to: 'file_objects#download'
  post '/file_objects/master', to: 'file_objects#upload_from_master'
  post '/file_objects/devel', to: 'file_objects#upload_from_devel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
