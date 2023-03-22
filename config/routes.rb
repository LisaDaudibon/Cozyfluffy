Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :admin, only: %i[index new]
  resources :cats, only: %i[index new show edit]
  resources :association, only: %i[index new show edit]
  resources :menu, only: %i[index new create edit update destroy]
end
