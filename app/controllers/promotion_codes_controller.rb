# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def index
    @promotion_code = PromotionCode.all
  end

  def create
    find_promotion_code = PromotionCode.find_by(code: params[:code])
    unless find_promotion_code.used
      find_promotion_code.update(used: true, cart_id: session[:cart_id])
      flash[:success] = 'プロモーションコードが適応されました'
      redirect_to cart_products_path
    else
      flash[:alert] = 'このコードは無効です'
      redirect_to request.referer
    end
  end
end
