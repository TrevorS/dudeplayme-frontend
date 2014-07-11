Rails.application.routes.draw do
  get 'searches/new', to: 'searches#new'
  get 'searches', to: 'searches#create'

  root 'searches#new'
end
