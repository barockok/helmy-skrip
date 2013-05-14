HelmySkrip::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}, :path => 'membership'
  resources :reports
  resources :transactions
  resources :administration_fees , :only => [:index]

  resources :products

  resources :nasabahs do
    member do
      put :approve
    end
  end
  resource :user, :only => [:edit, :show] , :as => :profile , :path => 'profile' do
    member do
      get '/' , :action => :profile
      get :edit, :action => :edit_profile
      put '/' , :action => :update_profile
      get :edit_password
      put :edit_password, :action => :update_password
    end
  end
  resources :users
  get 'index' => 'internal#index'
  root :to => 'internal#index'
end
