# frozen_string_literal: true

class OrdersController < ApplicationController
  # Basic認証を有効化します
  http_basic_authenticate_with name: 'admin', password: 'pw', only: :index
  skip_before_action :verify_authenticity_token

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # メール送信時にプレビューに渡すデータを指定
      OrderMailer.send_order_email(@order).deliver_later
      redirect_to root_path, flash: { success: 'ご購入ありがとうございました。' }
      session[:cart_id] = nil
    else
      flash[:notice] = 'DBにデータを追加するのに失敗しています。空欄はありませんか？すべてのフォームに入力してください'
      render template: 'cart_products/index'
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :first_name, :last_name, :username,
      :email, :address, :address2, :country, :prefecture,
      :credit_card_name, :credit_card_number, :credit_card_expiration, :credit_card_cvv, :cart_id
    ).merge(cart_id: session[:cart_id])
  end
end
