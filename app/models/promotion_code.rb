class PromotionCode < ApplicationRecord
  belongs_to :cart, optional: true
end
