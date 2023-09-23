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
    @product = Product.new(product_params)
    @product.save
    if @product.save
      redirect_to products_path

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

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image)
  end
end
