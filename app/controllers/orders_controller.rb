class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_products, only: [:new, :create, :index]

  def new
    @order = Order.new
    authorize @order
    @order.build_company_detail
  end

  def create
    @order = Order.new(order_params)
    authorize @order
    @order.active = true
    @order.total = @order.package.price
    @order.product_array = @order.order_prod_arr
    @order.service_array = @order.order_serv_arr
    @order.package_name = @order.package.name
    if @order.save!
      OrderMailer.bestilling_bekreftelse(@order).deliver_now
      redirect_to order_path(@order)
    else
      render new_order_path
    end
  end

  def edit
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to admins_order_path
    else
      render edit
    end
  end

  def show
  end

  def index
    @orders = policy_scope(Order)
  end

  def destroy
    @order.destroy

    redirect_to admins_order_path
  end

  def takk
    authorize :order, :takk?
  end

  private

  def order_params
    params.require(:order).permit(:logo_name, :slogan, :industry_id, :color, :style_id, :reference_logo, :package_id, :active, product_ids:[ ], company_detail_attributes:[:first_name, :last_name, :phone, :email, :business_name, :org_no, :address, :zip_code, :referral, :established])
  end

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

  def set_products
    @products = Product.all
  end
end
