Rails.application.routes.draw do
  resources :countries
  resources :states
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'about', to: 'home#about'
  get 'signup', to: 'users#new'
  resources :users, except:[:new]
  resources :cities
  resources :whitelist_ips
  get 'access_logs/modules/show/:module_name',to:'access_logs#show'
  get 'access_logs/modules',to:'access_logs#modules'
  get 'login', to:'sessions#new'
  post 'login',to:'sessions#create'
  delete 'logout',to:'sessions#destroy'
end
