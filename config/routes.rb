Rails.application.routes.draw do

  root 'articles#index'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :categories
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
end
