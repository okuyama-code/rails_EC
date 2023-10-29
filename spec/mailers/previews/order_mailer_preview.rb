# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def send_order_email(o)
    pp "メール送信"
    # 引数で渡ってきたorderという名前の値を@orderという名前のインスタンス変数に代入する。
    #たまたま名前をそろえているだけ。コードが見やすくなるから。orderは何でもいい。
    @order = o
    # pp @order
    mail(to: @order.email, subject: 'ご購入いただきありがとうございます')

  end
end
