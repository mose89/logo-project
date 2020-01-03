class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product

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
    @products = policy_scope(Product)
    set_meta_tags title: "Alle våre design tjenester",
                  site: "LogoMaker'n",
                  reverse: true
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
    authorize @product
  end
end
