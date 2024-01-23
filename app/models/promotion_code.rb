# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  belongs_to :order, optional: true
  has_many :carts, dependent: :nullify
end
