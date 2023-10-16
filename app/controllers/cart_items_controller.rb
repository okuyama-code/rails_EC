class CartItemsController < ApplicationController
  def index
    @cart_items = current_cart.cart_items
  end

  def create
    increase_or_create(params[:product_id])
    redirect_to cart_items_path, notice: "カートの追加に成功しました"
  end

  def destroy
    # @cart_items = current_cart.cart_items
    # @cart_items.destroy_all
    @cart_item = current_cart.cart_items.find_by(cart_id: session[:cart_id])
    @cart_item.destroy
    redirect_to request.referer
  end



  def current_cart
    if session[:cart_id]
      Cart.find(session[:cart_id])
    else
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end

  private

  def increase_or_create(product_id)
    cart_item = current_cart.cart_items.find_by(product_id:)
    if cart_item
      cart_item.increment!(:quantity, 1)
    else
      current_cart.cart_items.build(product_id:).save
    end
    cart_item.quantity = params[:quantity].to_i
      cart_item.save
  end

end
