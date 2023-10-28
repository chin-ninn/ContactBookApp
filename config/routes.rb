Rails.application.routes.draw do
  devise_for :users
  root to: "notices#index"
  resources :notices, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :photos, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
