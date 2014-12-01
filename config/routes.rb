Rails.application.routes.draw do
  devise_for :users
  resources :properties
  root "properties#new"
  resources :properties, only: [:show, :create, :new]
  get "properties/:id/similar", to: "properties#similar", as: :similar
  get "*path", to: redirect('/')
  get "properties/index"


end
