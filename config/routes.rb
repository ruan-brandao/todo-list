Rails.application.routes.draw do
  root "lists#index"

  devise_for :users

  resources :lists

  get 'lists/:id/favorite' => 'lists#favorite'
  get 'lists/:id/unfavorite' => 'lists#unfavorite'
  get 'favorites' => 'lists#favorites'
end
