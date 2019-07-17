class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to(@order)
    else
      render new
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
    params.require(:order).permit(:name, :description, :price)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
