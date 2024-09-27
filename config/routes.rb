# frozen_string_literal: true

Rails.application.routes.draw do
  get "posts/index"
  get "posts/new"
  get "posts/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  # routes for static pages
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get "/blog", to: "static_pages#blog"

  # routes for login and signup
  get "/signup", to: "users#new"
  post "/signup", to: "sessions#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, only: %i[new create]
  resources :posts, only: [:index, :new, :create]
  resources :passwords, only: [:edit, :update]
end
