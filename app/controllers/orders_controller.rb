class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create

  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :username, :email, :address, :address_2, :country, :prefecture, :credit_card_number, :credit_card_expiration, :credit_card_cvv)
  end
end
