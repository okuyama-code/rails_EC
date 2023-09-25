class Cart < ApplicationRecord
   # 1つのカートは複数のカートアイテム（商品との結びつき）を持つ
  has_many :cart_items
  # 1つのカートは複数の商品を持つ（カートアイテムを介して）
  has_many :products, through: :cart_items

  # カートにアイテムを追加するメソッド
  def add_item(item_id)
    product = Product.find(item_id)

    # カートにすでに同じ商品が存在するか確認
    cart_item = cart_items.find_by(product_id: product.id)

    if cart_item
      # すでにカート内に商品が存在する場合、数量を増やす
      cart_item.quantity += 1
    else
      # カートに新しい商品を追加する場合、新しいカートアイテムを作成
      cart_item = cart_items.build(product: product, quantity: 1)
    end

    # カートアイテムを保存
    cart_item.save

    cart_item
  end
  
end

