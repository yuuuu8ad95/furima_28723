Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'messages/new'
  root to: "items#index"
  resources :items
  resources :items do
    resources :orders, only: [:index, :create] 
    resources :destinations
    resources :messages, only: [:index, :new, :create] 
  end
end
