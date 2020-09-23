Rails.application.routes.draw do
  get 'messages/new'
  root to: "items#index"
  devise_for :users
  resources :items
  resources :items do
    resources :orders, only: [:index, :create] 
    resources :destinations
    resources :messages, only: [:index, :new, :create] 
  end
end
