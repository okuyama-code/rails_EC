# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private
    def current_cart
    #セッションから取得したcart_idを基にcartテーブルからユーザー情報を取得
    @current_cart = Cart.find_by(id: session[:cart_id])
    #存在しない場合cartを作成
    @current_cart = Cart.create unless @current_cart
    #取得したuser情報よりIDを取得してセッションに設定
    session[:cart_id] = @current_cart.id
    #cart情報を返却
    @current_cart
    end
end

# 参考URL https://teratail.com/questions/375367
