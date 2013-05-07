HelmySkrip::Application.routes.draw do
  resources :transactions

  resources :products

  resources :nasabahs

  get 'index' => 'internal#index'
  root :to => 'internal#index'
end
