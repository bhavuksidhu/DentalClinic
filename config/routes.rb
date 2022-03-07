Rails.application.routes.draw do
  resources :treatment_coordinators
  resources :staff_infos
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :super_admins, path: 'super_admins', controllers: {
    sessions: 'super_admins/sessions',
    registrations: 'super_admins/registrations',
  }

  resources :dentist_hygienists
  resources :dentists
  resources :agents 
  resources :managers
  resources :clinics
  resources :counselings
  
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    masquerades:   'users/masquerades'
  }
  
  resources :patients do 
    get 'appointment', on: :member 
    patch 'add_appointment', on: :collection
  end 
  
  get 'user/index'
  
  get 'homepage/home'
  root 'homepage#home'
  get 'translate',to: 'homepage#translate'

  resources :registrations 
  # post "registrations", to: "registrations#index"
  # get "sign_up", to: "registrations#new"
  # post "sign_up", to: "registrations#create"
  # get 'user/:id/edit', to: "registrations#edit"
  # patch 'user_update', to: "registrations#update"

end
