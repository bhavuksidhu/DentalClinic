Rails.application.routes.draw do
  resources :staff_infos
  resources :dentist_hygienists
  resources :dentists
  resources :agents 
  resources :managers
  resources :clinics
  
  
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

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get 'user/:id/edit', to: "registrations#edit"
  patch 'user_update', to: "registrations#update"

end
