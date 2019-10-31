Rails.application.routes.draw do
  resources :preferences
  resources :users
  root to: 'pages#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'search', to: 'search#findbyterm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
