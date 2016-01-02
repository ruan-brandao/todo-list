Rails.application.routes.draw do
  root "lists#index"

  devise_for :users

  resources :lists
end
