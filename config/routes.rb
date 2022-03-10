Rails.application.routes.draw do
  resources :treatment_coordinators
  resources :staff_infos
  # mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
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
  resources :oral_types
  get 'aggregation_basic_information',to: "counselings#aggregation_basic_information"
  get 'new_patient_progress',to: "visit_routes#new_patient_progress"
  
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    masquerades:   'users/masquerades'
  }
  
  resources :patients do 
    get 'appointment', on: :member 
    patch 'add_appointment', on: :collection
    post 'create_appointment', on: :collection
    get 'all_appointment', on: :collection
  end 
  
  get 'user/index'
  
  get 'homepage/home'
  root 'homepage#home'
  get 'translate',to: 'homepage#translate'

  resources :registrations 


  resources :visit_routes, except: [:destroy,:show]
  get "monthly_tabulation",to: "visit_routes#monthly_tabulation"

end
