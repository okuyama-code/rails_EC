# frozen_string_literal: true

class CartProductsController < ApplicationController
  before_action :set_cart

  def index
    @cart_products = @cart.cart_products
    @order = Order.new
    @promotion_code = PromotionCode.new
    
    @total = @cart.calc_total

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

    redirect_to request.referer, notice: 'カートに追加しました'
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to request.referer, flash: { success: "#{cart_product.product.name}を削除しました。" }
  end


end
