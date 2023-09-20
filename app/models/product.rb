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
end
