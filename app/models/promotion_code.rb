class PromotionCode < ApplicationRecord
  belongs_to :order, optional: true

  def use!
    update(used: true)
  end
end
