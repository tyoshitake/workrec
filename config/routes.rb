Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:show, :new, :create] do
    resources :worktimes, only: [:index, :new, :create, :destroy],
                         shallow: true
  end
  
  resources :works, only: [:create, :destroy]
  resources :projects, only: [:show, :index, :destroy, :new, :create]
  
end
