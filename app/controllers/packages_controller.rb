class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  before_action :set_products, only: [:new, :edit, :index, :update, :destroy]
  before_action :set_services, only: [:new, :edit, :index, :update, :destroy]
  before_action :set_package_products, only: [:show, :edit, :update, :destroy]
  before_action :set_package_services, only: [:show, :edit, :update, :destroy]

  def new
    @package =Package.new
    authorize @package
  end

  def create
    @package = Package.new(package_params)
    authorize @package

    prod_ids = params[:package][:product_ids]
    prod_ids.each do |prod_id|
      @package.products << Product.find(prod_id.to_i)
    end

    serv_ids = params[:package][:service_ids]
    if serv_ids.length > 1
      serv_ids.each do |serv_id|
        @package.services << Service.find(serv_id.to_i)
      end
    else
      @package.services << Service.find(serv_ids)
    end

    if @package.save!
      redirect_to root_path
    else
      render new
    end
  end

  def edit
  end

  def update
    params[:package][:product_ids] ||=[]
    params[:package][:service_ids] ||=[]
    if @package.update_attributes(edit_package_params)
      redirect_to(@package)
    else
      render edit
    end
  end

  def show
  end

  def index
    @packages = policy_scope(Package)
    @galleries = Gallery.all
  end

  def destroy
    @package.destroy

    redirect_to packages_path
  end

  private

  def edit_package_params
    params.require(:package).permit!
  end

  def package_params
    params.require(:package).permit(:name, :price)
  end

  def set_package
    @package = Package.find(params[:id])
    authorize @package
  end

  def set_products
    @products = Product.all
  end

  def set_services
    @services = Service.all
  end

  def set_package_products
    @package_products = @package.products
  end

  def set_package_services
    @package_services = @package.services
  end

end
