Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'

  #get 'static_pages/home'
  #resources :users #might need? Was in conflict area


  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  


  #post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  #post '/users',   to: 'users#create' #already below
  delete '/logout',  to: 'sessions#destroy'
 
  resources :users
  resources :ssousers

  post '/users',   to: 'users#create'
  #SSO routes
  get 'auth/:provider/callback' => 'sessions#sso_create'
  #post '/logout' => 'sessions#destroy' #already above
  get 'auth/failure' => 'sessions#failure'
  get 'auth/twitter', :as => 'login2'
  
  
  get '/profiles', to: 'profiles#index'
  get '/profiles/:id', to: 'profiles#show'
  
  post '/add_like/:profiles' => 'profiles#add_like'
  
  
 
  #root 'users#index'
  
end

