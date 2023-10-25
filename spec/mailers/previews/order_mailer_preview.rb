# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def send_order_email
    @order = params[:order]
    mail(to: @order.email, subject: 'ご購入いただきありがとうございます')
  end
end
