# frozen_string_literal: true

class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart
end
