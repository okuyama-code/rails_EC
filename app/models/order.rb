class Order < ApplicationRecord
  include Discard::Model
  # デフォルトでは、Post.allは削除されたレコードも含めて返す。この挙動を変えて削除されていないものだけ返すようにする
  # default_scope -> { kept }

  # order belongs to cart | orderはcartに属します
  belongs_to :cart
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
end

# Discard::Modelをインクルードしているので、keptメソッドが使うことができます。このメソッドでは、削除されていない記事の一覧を取得することができます。またその逆のメソッドがdiscardedで、削除された記事の一覧を取得することができます。
# https://sakaishun.com/2021/04/13/discard/ わかりやすい記事

# discard　破棄
