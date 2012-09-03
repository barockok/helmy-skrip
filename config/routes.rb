Fayad::Application.routes.draw do
  resources :setorans

  get "auth/login"

  get "auth/logout"

  resources :users

  resources :nasabahs

  root :to => "home#index"
end
