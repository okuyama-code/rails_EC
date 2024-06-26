# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update show]

  def index
    @products = Product.kept
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path(@product)
    else
      render :new
    end
  end

  def show
    @products = Product.kept.order(created_at: :desc)
    if @product.nil?
      flash[:error] = '指定された商品は存在しません。'
      redirect_to root_path
    end
    @cart_product = CartProduct.new
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: '商品情報が更新されました。'
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image)
  end
end
