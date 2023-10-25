class OrderMailer < ApplicationMailer
  def send_order_email
    @order = params[:order]
    mail(to: @order.email, subject: 'ご購入いただきありがとうございます')
  end
end
