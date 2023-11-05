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
  resources :promotion_codes, only: %i[index]

  post '/cart_products/destroy', to: 'cart_products#destroy'
end

# param: :item_id は、アイテムの識別子（通常、id）の名前を指定しています。ここではitem_id
# controller: :cart_products は、itemsリソース内のアクションを処理するために CartProductsController という名前のコントローラーを使用することを示す
