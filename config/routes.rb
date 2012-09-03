Fayad::Application.routes.draw do
  resources :users

  resources :nasabahs

  root :to => "home#index"
end
