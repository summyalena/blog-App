Rails.application.routes.draw do
  devise_for :users
  get 'likes/new'
  get 'comments/new'
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :likes, only: [:create] 
      resources :comments, only:[:create, :new]
    end
  end
end
