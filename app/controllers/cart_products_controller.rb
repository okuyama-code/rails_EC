# frozen_string_literal: true

class CartProductsController < ApplicationController
  def index
    @cart_products = current_cart.cart_products
    @order = Order.new
  end

  def create
    increase_or_create(params[:product_id])

    redirect_to cart_products_path, notice: 'カートの追加に成功しました'
  end

  def destroy
    # @cart_products = current_cart.cart_products
    # @cart_products.destroy_all
    @cart_product = current_cart.cart_products.find_by(cart_id: session[:cart_id])
    @cart_product.destroy
    redirect_to request.referer
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

  def increase_or_create(product_id)
    cart_product = current_cart.cart_products.find_by(product_id:)
    if cart_product
      # cart_product.increment!(:quantity, 1)
      cart_product.update(quantity: cart_product.quantity + 1)
    else
      current_cart.cart_products.build(product_id:).save
    end
  end
end
