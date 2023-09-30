class CartsController < ApplicationController
  def index
    @cart = current_cart
  end


  private

  def current_cart
    if session[:cart_id]
      Cart.find(session[:cart_id])
    else
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end
end
