Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :admin, only: %i[index new create ] 
  resources :cats, only: %i[index new show edit create]
  resources :association, only: %i[index new show edit]
  resources :menu, only: %i[index new show edit]
end
