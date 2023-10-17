# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  namespace :admin do
    resources :products
  end

  resources :products

  resources :cart_items

  post '/cart_items/destroy', to: 'cart_items#destroy'
end

# param: :item_id は、アイテムの識別子（通常、id）の名前を指定しています。ここではitem_id
# controller: :cart_items は、itemsリソース内のアクションを処理するために CartItemsController という名前のコントローラーを使用することを示す
