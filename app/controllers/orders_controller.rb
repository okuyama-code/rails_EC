class OrdersController < ApplicationController
  # Basic認証
  #TODO http_basic_authenticate_with name: 'admin', password: 'pw'　
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    @order = Order.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], address: params[:address], address_2: params[:address_2], country: params[:country], prefecture: params[:prefecture], credit_card_name: params[:credit_card_name], credit_card_number: params[:credit_card_number], credit_card_expiration: params[:credit_card_expiration], credit_card_cvv: params[:credit_card_cvv], cart_id: session[:cart_id])
    if @order.save
       # メール送信時にプレビューに渡すデータを指定
      # OrderMailer.with(order: @order).send_order_email.deliver_later
      OrderMailer.send_order_email(@order).deliver_later
      redirect_to orders_path, notice: "購入者の情報をordersテーブルに保存しました"
      # redirect_to root_path, notice: "ご購入ありがとうございます。"

      # PostMailer.new_post_email(user, @post).deliver_later
    else
      flash[:notice] = "DBにデータを追加するのに失敗しています。空欄はありませんか？すべてのフォームに入力してください"
      render template: "cart_products/index"
    end

  end

  private


  # def order_params エラーになる
  #   params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address_2, :country, :prefecture, :credit_card_name, :credit_card_number, :credit_card_expiration, :credit_card_cvv)
  # end
end
