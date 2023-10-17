# frozen_string_literal: true

class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :stock
    validates :image
  end
  # 商品モデルに対して、1つの画像ファイルを添付するための関連付けを定義している。これにより、商品に対して画像を添付できるようになる。
  has_one_attached :image

  # 1つの商品は複数のカートアイテム（カートとの結びつき）を持つ
  has_many :cart_items, dependent: :destroy
  # 1つの商品は複数のカートを持つ（カートアイテムを介して）
  has_many :carts, through: :cart_items
end

# through: :cart_items の部分が重要で、これにより、カートと商品はカートアイテムを介して関連付けられ、cartモデルから直接productモデルにアクセスできます。
