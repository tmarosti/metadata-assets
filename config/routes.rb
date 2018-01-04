Rails.application.routes.draw do
  get '/browse', to: 'media_assets#index'
  resources :media_assets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
