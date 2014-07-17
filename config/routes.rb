Rails.application.routes.draw do
  resources :searches, only: [:new, :create]
  resources :albums, only: :show
  root 'searches#new'
end
