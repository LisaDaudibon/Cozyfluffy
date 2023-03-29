Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end

  root "home#index"
  get "home/index"
  resources :admin, only: %i[index new create edit update destroy]
  namespace :admin do
    resources :users, only: %i[index destroy]
  end
  resources :cats
  resources :association
  resources :menu, only: %i[index]
  resources :categories, only: %i[new create edit update destroy]
  resources :products, only: %i[new create edit update destroy]
end