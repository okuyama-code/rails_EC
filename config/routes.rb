Rails.application.routes.draw do
  namespace :admin do
   resources :products
  end
  root "products#index"

  resources :products
end
