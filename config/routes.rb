Sugar::Application.routes.draw do |map|

  match '/login', :to => 'user_sessions#new', :as => :login
  match '/logout', :to => 'user_sessions#destroy', :as => :logout
  match '/register', :to => 'users#new', :as => :register
  
  match '/dashboard', :to => 'static#dashboard', :as => :admin
  
  match '/users(/:city_name)', :to => 'users#index'
  match '/deals(/:city_name)', :to => 'deals#index'
  
  resources :users, :user_sessions, :companies, :charities, :deals
  
  root :to => 'static#index'
  
  match '*path', :to => 'static#index'
end
