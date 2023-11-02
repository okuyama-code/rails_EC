# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def send_order_email(order)
    Rails.logger.debug 'メール送信'
    # 引数で渡ってきたorderという名前の値を@orderという名前のインスタンス変数に代入する。
    # たまたま名前をそろえているだけ。コードが見やすくなるから。orderは何でもいい。
    @order = order
    # pp @order
    mail(to: @order.email, subject: 'ご購入いただきありがとうございます')
  end
end

# OrderMailerクラスのsend_order_emailメソッドを呼びます。引数に@orderを指定しながら。
# OrderMailer.send_order_email(@order).deliver_later
