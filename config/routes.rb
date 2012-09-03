Fayad::Application.routes.draw do
  get "auth/login"

  get "auth/logout"

  resources :users

  resources :nasabahs

  root :to => "home#index"
end
