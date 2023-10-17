# frozen_string_literal: true

class Cart < ApplicationRecord
  # 1つのカートは複数のカートアイテム（商品との結びつき）を持つ
  has_many :cart_items, dependent: :destroy
  # 1つのカートは複数の商品を持つ（カートアイテムを介して）
  has_many :products, through: :cart_items
end
