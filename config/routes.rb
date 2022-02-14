Rails.application.routes.draw do
  resources :clinics
  get 'user/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  get 'homepage/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#home'


end
