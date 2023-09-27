class CartsController < ApplicationController
  before_action :setup_cart_item!, only: %i[index create destroy]

  def index
    @cart_items = current_cart.cart_items.includes([:product])
  end

  def create
    # カートアイテムを取得または作成
    @cart_item = current_cart.cart_items.find_or_initialize_by(product_id: params[:product_id])
    @cart_item.quantity += params[:quantity].to_i
    if  @cart_item.save
      flash[:notice] = '商品が追加されました。'
      redirect_to carts_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to product_path
    end
  end

  def update
    if @cart_item.update(quantity: params[:quantity].to_i)
      flash[:notice] = 'カート内のギフトが更新されました'
    else
      flash[:alert] = 'カート内のギフトの更新に失敗しました'
    end
    redirect_to carts_path
  end

  def delete_item
    if @cart_item.destroy
      flash[:notice] = 'カート内のギフトが削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to carts_path
  end


  # カート内の商品合計に利用
  def sum_of_price
    product.price * quantity
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end


 # 現在のカートを取得するメソッド
 def current_cart
  # セッションとカートの紐付け
  # セッションに保存されたcart_idをもとにカートを検索
  current_cart = Cart.find_by(id: session[:cart_id]) || Cart.create
  # セッションにcart_idが存在しない場合、新しいカートを作成してセッションに保存
  # current_cartを返す
  current_cart
  end
end

