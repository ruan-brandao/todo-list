Rails.application.routes.draw do
  root "lists#index"
  
  devise_for :users

  resources :lists, only: [:index, :show, :new, :create]
end
