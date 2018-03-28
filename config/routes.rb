Rails.application.routes.draw do
  resources :users
  get 'static_pages/home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/users',   to: 'users#create'

  
  
 
  #root 'users#index'
  root 'static_pages#home'
end