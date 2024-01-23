# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  before_action :set_cart

  def register
    if params[:code].empty?
      redirect_to request.referer, flash: { danger: 'コードを入力してください' }
      return
    end

    code = params[:code]
    promotion_code = PromotionCode.find_by(code:, order_id: nil)

    if promotion_code
      @cart.update(promotion_code_id: promotion_code.id)
      redirect_to request.referer, flash: { success: 'プロモーションコードを登録しました。' }
    else
      redirect_to request.referer, flash: { danger: '入力したコードが間違っているか、すでに使用済です。' }
    end
  end

  def cancel
    @cart.update(promotion_code_id: nil)
    redirect_to request.referer, flash: { success: 'プロモーションコードを解除しました。' }
  end
end
