Rails.application.routes.draw do
  resources :dentist_hygienists
  resources :dentists
  resources :patients 
  resources :agents 
  resources :managers
  resources :clinics

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    masquerades:   'users/masquerades'
  }

  get 'user/index'
  get 'user/:id/user_change', to: "user#change_pass"
  patch 'user_update', to: "user#update_pass"


  get 'homepage/home'
  root 'homepage#home'

end
