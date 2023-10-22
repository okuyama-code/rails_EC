class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path, notice: "購入者の情報をordersテーブルに保存しました"
    else
      alert: "DBにデータを追加するのに失敗しています。空欄はありませんか？すべてのフォームに入力してください"
      render template: "cart_products/index"
    end

  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address_2, :country, :prefecture, :credit_card_number, :credit_card_expiration, :credit_card_cvv)
  end
end
