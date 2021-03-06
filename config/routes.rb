Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create,:destroy] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:create]
      collection do
        get 'search'
      end
    end
  end
end
