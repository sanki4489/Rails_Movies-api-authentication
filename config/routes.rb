Rails.application.routes.draw do
  post 'login', to: 'sessions#login' 
  delete 'logout', to: 'sessions#logout'
  post 'signup', to: 'users#signup'
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
