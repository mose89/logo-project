class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to(@product)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to(@product)
    else
      render edit
    end
  end

  def show
  end

  def index
    @products = Product.all
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :photo_cache)
  end

  def set_product
    @product = Product.friendly.find(params[:id])
  end
end
