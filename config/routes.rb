Rails.application.routes.draw do
  resources :countries
  resources :states
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'about', to: 'home#about'
  get 'signup', to: 'users#new'
  resources :users, except:[:new]
end
