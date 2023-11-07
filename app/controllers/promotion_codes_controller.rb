class PromotionCodesController < ApplicationController
  def index
    @promotion_code = PromotionCode.all
  end

  def create
    find_promotion_code = PromotionCode.find_by(code: params[:code])
    if find_promotion_code.used == false
      find_promotion_code.used = true
      find_promotion_code.cart_id = session[:cart_id]
      find_promotion_code.save
      flash[:success] = 'プロモーションコードが適応されました'
      redirect_to cart_products_path
    else
      flash[:alert] = 'このコードは無効です'
      redirect_to request.referer
    end

    pp "デバック"
    pp params[:code]
    pp find_promotion_code.used
    pp find_promotion_code.cart_id
  end
end
