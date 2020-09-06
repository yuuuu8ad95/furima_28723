Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  devise_for :users
  resources :items, only:[:index, :new, :create, :show] do
  end
end
