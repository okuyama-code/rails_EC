# frozen_string_literal: true

class CartProductsController < ApplicationController
  before_action :set_cart

  def index
    # @cart_products = current_cart.cart_products
    @order = Order.new
    @promotion_code = PromotionCode.new
  end

  def create
    pp "デバック！！！！！！！！！！！！！"

    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    cart_product = CartProduct.find_by(product_id:, cart_id: @cart.id)

    if cart_product
      cart_product.increment(:quantity, quantity)
      cart_product.save
    else
      CartProduct.create(product_id:, cart_id: @cart.id, quantity:)
    end
    
    redirect_to request.referer, notice: 'カートの追加に成功しました'
  end

  def destroy
    # @cart_products = current_cart.cart_products
    # @cart_products.destroy_all
    @cart_product = current_cart.cart_products.find_by(cart_id: session[:cart_id])
    @cart_product.destroy
    redirect_to request.referer
  end

  private

  def increase_or_create(product_id)
    cart_product = current_cart.cart_products.find_by(product_id:)
    if cart_product
      # cart_product.increment!(:quantity, 1)
      cart_product.update(quantity: cart_product.quantity + 1)
    else
      current_cart.cart_products.build(product_id:).save
    end
  end

  # def total_price
  #   cart_products.
  # end
end
