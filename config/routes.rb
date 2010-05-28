Sugar::Application.routes.draw do |map|
  resources :fine_prints

  resources :highlights


  match '/login', :to => 'user_sessions#new', :as => :login
  match '/logout', :to => 'user_sessions#destroy', :as => :logout
  match '/register', :to => 'users#new', :as => :register
  
  match '/dashboard', :to => 'static#dashboard', :as => :admin
  match '/coming_soon', :to => 'static#coming_soon'
  match '/about', :to => 'static#about'
  match '/sugarbucks', :to => 'static#sugarbucks'
  match '/legal', :to => 'static#legal'
  match '/faq', :to => 'static#faq'
  
  resources :users, :user_sessions, :companies, :charities, :deals, :cities
  
  root :to => 'static#index'
  
  match '/:city_name', :to => 'deals#show'
  match '*path', :to => 'static#index'
end
