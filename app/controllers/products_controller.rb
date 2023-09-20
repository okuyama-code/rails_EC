class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update]

  def index
    @products = Product.all
    @products = Product.order(created_at: :desc)
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
    @products = Product.all
    @products = Product.order(created_at: :desc)
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to products_path(@product)
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
