class CompanyDetailsController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    @company_detail = CompanyDetail.new
  end

  def create
    @company_detail = CompanyDetail.new(order_params)
    @company_detail.order_id = @order.id

    if @company_detail.save
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @company_detail.update(order_params)
      redirect_to(@company_detail)
    else
      render edit
    end
  end

  def show
  end

  def index
    @company_details = CompanyDetail.all
  end

  def destroy
    @company_detail.destroy

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :phone, :email, :business_name, :org_no, :address, :zip_code, :referral)
  end

  def set_company_detail
    @company_detail = CompanyDetail.find(params[:id])
  end

  def set_products
    @products = Product.all
  end
end
