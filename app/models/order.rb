# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart

  before_create do
    cart.decrease_product_stock
  end

  after_create do
    update_promotion_code
  end

  private

  def update_promotion_code
    promotion_code = cart.promotion_code
    return unless promotion_code && promotion_code.order_id.nil?

    promotion_code.update(order_id: id)
  end
end
