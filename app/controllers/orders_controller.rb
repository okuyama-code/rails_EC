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
    @order = Order.new(build_order_params)
    if @order.save
      # メール送信時にプレビューに渡すデータを指定
      OrderMailer.send_order_email(@order).deliver_later
      # redirect_to orders_path, notice: '購入者の情報をordersテーブルに保存しました'
      redirect_to root_path, notice: 'ご購入ありがとうございます。'
      session[:cart_id] = nil
    else
      flash[:notice] = 'DBにデータを追加するのに失敗しています。空欄はありませんか？すべてのフォームに入力してください'
      render template: 'cart_products/index'
    end
  end

  private

  def build_order_params
    {
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email],
      address: params[:address],
      address2: params[:address2],
      country: params[:country],
      prefecture: params[:prefecture],
      credit_card_name: params[:credit_card_name],
      credit_card_number: params[:credit_card_number],
      credit_card_expiration: params[:credit_card_expiration],
      credit_card_cvv: params[:credit_card_cvv],
      cart_id: session[:cart_id]
    }
  end
end
