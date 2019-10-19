Rails.application.routes.draw do
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users, :only => [:index, :show, :edit, :update]
  root "users#index"
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  resources :ginfos, :only => [:new, :edit, :create, :update]

  get '/outline_infos/company' => 'outline_infos#company'
  get '/outline_infos/help' => 'outline_infos#help'
  get '/outline_infos/code' => 'outline_infos#code'
  get '/outline_infos/our_philosophy' => 'outline_infos#our_philosophy'
  get '/outline_infos/policy' => 'outline_infos#policy'
  get '/outline_infos/terms' => 'outline_infos#terms'
  get '/outline_infos/contact' => 'outline_infos#contact'
end
