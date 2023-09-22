# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
   resources :products, only: %i[index show new create edit update]
  end
  root "products#index"

  resources :products

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
