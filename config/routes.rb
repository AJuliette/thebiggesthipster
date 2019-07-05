# frozen_string_literal: true

Rails.application.routes.draw do
  get 'weapons/index'
  root to: 'pages#home'
  resources :characters
  resources :games, only: %i[new index show create]
  resources :weapons, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
