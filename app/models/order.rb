# frozen_string_literal: true

class Order < ApplicationRecord
  # order belongs to cart | orderはcartに属します
  belongs_to :cart
end
