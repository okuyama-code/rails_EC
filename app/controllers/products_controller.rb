class ProductsController < ApplicationController
  def index
    save_screenshot 'file_path', options
  end
end
