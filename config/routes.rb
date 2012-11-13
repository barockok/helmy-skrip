Fayad::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :setorans

  get "auth/login"

  get "auth/logout"

  resources :users

  resources :nasabahs

  root :to => "home#index"
end
