Rails.application.routes.draw do

  root 'articles#index'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :articles do
    member do
      put 'vote' => 'articles#upvote'
      put 'unvote' => 'articles#downvote'
    end
  end
end
