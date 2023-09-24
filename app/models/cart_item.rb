class CartItem < ApplicationRecord
  # 1つのカートアイテムは1つのカートに属する
  belongs_to :cart
   # 1つのカートアイテムは1つの商品に属する
  belongs_to :product
end


