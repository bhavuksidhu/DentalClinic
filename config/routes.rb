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
  get 'user/:id/user_change', to: "user#change_pass"
  patch 'user_update', to: "user#update_pass"


  get 'homepage/home'
  root 'homepage#home'

end
