class SingleOrdersController < ApplicationController
  before_action :find_single_order, only: [:show, :edit, :update, :destroy]

  def new
    @single_order = SingleOrder.new
    authorize @single_order
    @single_order.build_company_detail
  end

  def create
    @single_order = SingleOrder.new(single_order_params)
    authorize @single_order
    @single_order.active = true
    @single_order.total = @single_order.product.price
    if @single_order.save!
      OrderMailer.produkt_bestilling(@single_order).deliver_now
      OrderMailer.produkt_bestilling_bekreftelse(@single_order).deliver_now
      redirect_to single_orders_takk_path
    else
      render new
    end
  end

  def show
    @notes = @single_order.single_order_notes
  end

  def edit
  end

  def update
    if @single_order.update_attributes(single_order_params)
      redirect_to admins_order_path
    else
      render edit
    end
  end

  def index
    @single_orders = policy_scope(SingleOrder)
  end

  def takk
    authorize :single_order, :takk
  end

  private

  def single_order_params
    params.require(:single_order).permit(:product_id, :design, :design_cache, :active, company_detail_attributes:[:first_name, :last_name, :phone, :email, :business_name, :org_no, :address, :zip_code, :referral, :established])
  end

  def find_single_order
    @single_order = SingleOrder.find(params[:id])
    authorize @single_order
  end
end
