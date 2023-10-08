class CartsController < ApplicationController

  # helper_method :current_cart

  def my_cart
    # タスクリスト 上から順に実装して上から順に試していく、確かめていく(pで出す)
    # sessionに格納されたcart_idを取り出す。
    # session[:cart_id] = 1  // ほんとは前段階でクリアしている
    @cart_id = session[:cart_id]

    pp "デバック"
    pp @cart_id
    pp
    # データベースからデータを取り出したい →
    # cartテーブルから一件cart_idに対応したcart.idのデータを取り出して@cartに格納する
    @cart = Cart.find_by(id: @cart_id)
    pp "デバック"
    p @cart


    # @cartが取得できなかった場合、Cartテーブルのレコードを新しく作る. 自信がなかったらrails cで試す
    # nilかfalseならifの記述は実行されない。
    # うまくいかなっかったら@cart.idをpで調べていく
    if @cart.id
      p "trueのほう"
      @cart = Cart.find_by(id: @cart_id)
    else
      p "elseのほう"
      @cart_new = Cart.create
    end


    # 取得できたらviewにproductのname,price

    # cart_itemsのquantity


    # @cart = Cart.find_by(id: 1) || Cart.create
    # p "デバック"
    # p @cart.cart_items
  end


  # private

  # def current_cart
  #   if session[:cart_id]
  #     Cart.find_by(id: session[:cart_id])
  #   else
  #     cart = Cart.create
  #     session[:cart_id] = cart.id
  #     cart
  #   end
  # end

end
