# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create]

  get '/weather', to: 'weather#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/road_trip', to: 'road_trip#show'
  root 'welcome#index'

  # catch all for rogue uri's
  get '*pages', to: 'welcome#index'
end
