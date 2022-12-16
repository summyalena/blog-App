Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'users#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :likes, only: [:create] 
      resources :comments, only:[:create, :new]
      devise_for :users, controllers: { sessions: 'users/sessions' }
    end
  end
end
