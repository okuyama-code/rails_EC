# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  namespace :admin do
    resources :products
  end

  resources :products
  resources :cart_products
  resources :orders, only: %i[index show create]

  post 'register_promotion_code', to: 'promotion_codes#register'
  post 'cancel_promotion_code', to: 'promotion_codes#cancel'
end
