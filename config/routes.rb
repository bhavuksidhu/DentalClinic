Rails.application.routes.draw do
  resources :dentist_hygienists
  resources :dentists
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
  
  resources :patients 
  get 'patients/:id/appointment', to: "patients#appointment"
  patch 'add_appointment', to: "patients#add_appointment"

  get 'user/index'
  # get 'user/:id/user_change', to: "user#change_pass"
  # patch 'user_update', to: "user#update_pass"


  get 'homepage/home'
  root 'homepage#home'
  get 'translate',to: 'homepage#translate'

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get 'user/:id/edit', to: "registrations#edit"
  patch 'user_update', to: "registrations#update"

end
