Rails.application.routes.draw do
  get '/file_objects/:id/:filename', to: 'file_objects#download'
  get '/builds/Windows', to: 'builds#windows_builds'
  get '/builds/Linux', to: 'builds#linux_builds'
  get '/builds/OSX', to: 'builds#osx_builds'
  post '/file_objects/master/:plataform', to: 'file_objects#upload_from_master'
  post '/file_objects/devel/:plataform', to: 'file_objects#upload_from_devel'
  resources :file_objects
  resources :builds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
