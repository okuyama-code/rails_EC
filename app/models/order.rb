class Order < ApplicationRecord

  # order belongs to cart | orderはcartに属します
  belongs_to :cart
end

# Discard::Modelをインクルードしているので、keptメソッドが使うことができます。このメソッドでは、削除されていない記事の一覧を取得することができます。またその逆のメソッドがdiscardedで、削除された記事の一覧を取得することができます。
# https://sakaishun.com/2021/04/13/discard/ わかりやすい記事

# discard　破棄
