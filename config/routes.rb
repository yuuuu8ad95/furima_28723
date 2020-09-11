Rails.application.routes.draw do
  root to: "items#index"
  post 'items', to: 'items#create'
  devise_for :users
  resources :items, only:[:index, :new, :create, :show] do
  end
end
