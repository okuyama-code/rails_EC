class PromotionCodesController < ApplicationController
  def index
    @promotion_code = PromotionCode.all
  end
end
