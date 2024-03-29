Rails.application.routes.draw do
  root to: "notices#index"
  resources :admins, only: :show
  resources :notices
  resources :photos
  resources :calendars, except: :show

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
end
