class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_products, only: [:new, :create, :index]

  def new
    @order = Order.new
    @order.build_company_detail
  end

  def create
    @order = Order.new(order_params)
    @order.active = true
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
    if @order.update(order_params)
      redirect_to(@order)
    else
      render edit
    end
  end

  def show
  end

  def index
    @orders = Order.all
  end

  def destroy
    @order.destroy

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:logo_name, :slogan, :industry_id, :color, :style_id, :reference_logo, :package_id, product_ids:[ ], company_detail_attributes:[:first_name, :last_name, :phone, :email, :business_name, :org_no, :address, :zip_code, :referral, :established])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_products
    @products = Product.all
  end
end
