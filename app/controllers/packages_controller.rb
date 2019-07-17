class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  before_action :set_products, only: [:new, :edit, :update, :destroy]
  def new
    @package =Package.new
  end

  def create
    @package = Package.new(package_params)

    prod_ids = params[:package][:Product_ids]
    prod_ids.each do |prod_id|
      @package.products << Product.find(prod_id.to_i)
    end
    if @package.save
      redirect_to(@package)
    else
      render new
    end
  end

  def edit
  end

  def update

    prod_ids = params[:package][:product_ids]
    prod_ids.each do |prod_id|
      @package.products << Product.find(prod_id.to_i)
    end


    if @package.update(package_params)
      redirect_to(@package)
    else
      render edit
    end
  end

  def show
  end

  def index
    @packages = Package.all
  end

  def destroy
    @package.destroy

    redirect_to packages_path
  end

  private

  def package_params
    params.require(:package).permit(:name, :price)
  end

  def set_package
    @package = Package.find(params[:id])
  end

  def set_products
    @products = Product.all
  end
end
