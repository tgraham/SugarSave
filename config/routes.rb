Sugar::Application.routes.draw do |map|
  resources :locations


  match '/login', :to => 'user_sessions#new', :as => :login
  match '/logout', :to => 'user_sessions#destroy', :as => :logout
  match '/register', :to => 'users#new', :as => :register
  match '/reset', :to => 'password_resets#new', :as => :reset
  
  match '/dashboard', :to => 'static#dashboard', :as => :admin
  match '/about', :to => 'static#about'
  match '/sugarbucks', :to => 'static#sugarbucks'
  match '/legal', :to => 'static#legal'
  match '/faq', :to => 'static#faq'
  match '/contact', :to => 'contacts#new'
  
  match '/deal/:id', :to => 'deals#preview'
  
  resources :users, :user_sessions, :companies, :charities, :deals, :cities, :password_resets, :fine_prints, :highlights, :recommendations, :contacts
  
  root :to => 'static#index'
  
  match '/:city_name', :to => 'deals#show'
  match '*path', :to => 'static#index'
end
