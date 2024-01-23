# frozen_string_literal: true

class Cart < ApplicationRecord
  has_one :order, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  belongs_to :promotion_code, optional: true

  def decrease_product_stock
    cart_products.each do |cart_product|
      quantity = cart_product.quantity
      cart_product.product.update(stock: cart_product.product.stock - quantity)
    end
  end

  def calc_total
    total = cart_products.inject(0) { |result, cart_product| result + cart_product.subtotal }
    if promotion_code
      total -= promotion_code.discount
      total = 0 if total.negative?
    end
    total
  end
end
