Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users
  
  get 'about', to: 'pages#about'
  
  
  resources :users
  
  get 'dashboard', to: 'users#dashboard'
  
  resources :goals do
    resources :activities
  end
  
end
