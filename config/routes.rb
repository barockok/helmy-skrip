HelmySkrip::Application.routes.draw do
  devise_for :users

  resources :transactions

  resources :products

  resources :nasabahs do
    member do
      put :approve
    end
  end

  get 'index' => 'internal#index'
  root :to => 'internal#index'
end
