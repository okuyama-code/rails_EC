# frozen_string_literal: true

class Order < ApplicationRecord
  # order belongs to cart | orderはcartに属します
  belongs_to :cart
  has_one :promotion_code, dependent: :nullify

  def apply_promotion_code(code)
    promotion_code = PromotionCode.find_by(code: code, used: false)

    if promotion_code
      promotion_code.update(used: true)
    else

    end
  end
end
