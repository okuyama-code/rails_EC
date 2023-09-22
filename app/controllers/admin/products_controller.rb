class Admin::ProductsController < ApplicationController
  # Basic認証を有効化します
  http_basic_authenticate_with name: 'admin', password: 'pw'

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    # 商品を作成するためのコードをここに追加します
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path(@product)
      
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :price, :stock, :image)
  end
end
