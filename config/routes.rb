Rails.application.routes.draw do
  root to: "items#index"
  get 'items/new', to: 'items#new'
  devise_for :users
  resources :items, only:[:index, :new, :create, :show] do
  end
end
