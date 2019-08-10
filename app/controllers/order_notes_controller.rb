class OrderNotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :set_order, only: [:new, :edit, :update, :create, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @note = OrderNote.new
    authorize @note
  end

  def create
    @note = OrderNote.new(note_params)
    authorize @note
    @note.user_id = current_user.id
    @note.order = @order

    if @note.save
      redirect_to(@order)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(note_params)
      redirect_to order_path(@order)
    else
      render edit
    end
  end

  def destroy
    @note.destroy
    redirect_to order_path(@order)
  end

  private

  def note_params
    params.require(:order_note).permit(:description)
  end

  def set_note
    @note = OrderNote.find(params[:id])
    authorize @note
  end

  def set_order
    @order = Order.find(params[:order_id])
  end
end
