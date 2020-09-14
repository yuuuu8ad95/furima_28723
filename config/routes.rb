Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items
  resources :items, only: :order do
      get 'order', on: :member
    end

end
