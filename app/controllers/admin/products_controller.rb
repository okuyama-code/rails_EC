# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    # Basic認証を有効化します
    http_basic_authenticate_with name: 'admin', password: 'pw', only: :index

    def index
      @products = Product.kept
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      @product.save
      if @product.save
        redirect_to admin_products_path(@product), notice: '商品情報を作成しました。'
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
        redirect_to admin_products_path(@product), notice: '商品情報を更新しました。'
      else
        render :edit
      end
    end

    def show
      @product = Product.find(params[:id])
    end

    def destroy
      @product = Product.find(params[:id])
      @product.discard
      redirect_to admin_products_path(@product), notice: '商品を削除しました。'
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :image)
    end
  end
end
