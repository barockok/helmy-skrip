Fayad::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :setorans
  resources :users
  resources :nasabahs
  root :to => "admin#index"
end
