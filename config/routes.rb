Rails.application.routes.draw do
  resources :users
  get '/static_pages/home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/users',   to: 'users#create'
  #SSO routes
  get 'auth/:provider/callback' => 'sessions#sso_create'
  post '/logout' => 'sessions#destroy'
  get 'auth/failure' => 'sessions#failure'
  get 'auth/twitter', :as => 'login'

  
  
 
  #root 'users#index'
  root 'static_pages#home'
end