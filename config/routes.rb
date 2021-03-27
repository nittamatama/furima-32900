Rails.application.routes.draw do
  get 'address/index'
  devise_for :users
  root to: "products#index"
  
  resources :products do
    resources :purchases, only: [:index, :create]
  end
  resources :addresses, only: :index
end
