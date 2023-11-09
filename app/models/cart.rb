# frozen_string_literal: true

class Cart < ApplicationRecord
  has_one :order, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  has_one :promotion_code, dependent: :destroy
end
