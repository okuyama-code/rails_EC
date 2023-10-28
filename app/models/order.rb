class Order < ApplicationRecord
  include Discard::Model
  # デフォルトでは、Post.allは削除されたレコードも含めて返す。この挙動を変えて削除されていないものだけ返すようにする
  # default_scope -> { kept }

  belongs_to :cart
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
end
