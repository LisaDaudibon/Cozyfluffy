Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end

  root "home#index"
  get "home/index"
  resources :admin, only: %i[index new create] 
  resources :cats
  resources :association
  resources :menu
end