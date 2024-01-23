# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_session_cart_id, :set_cart_size

  private

  def set_session_cart_id
    session[:cart_id] ||= Cart.create.id
  end

  def set_cart_size
    @cart_size = Cart.find(session[:cart_id]).cart_products.size
  end

  def set_cart
    @cart = Cart.find(session[:cart_id])
  end
end
