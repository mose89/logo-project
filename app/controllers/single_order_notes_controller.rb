class SingleOrderNotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :set_single_order, only: [:new, :create, :destroy]

  def new
    @note = SingleOrderNote.new
    authorize @note
  end

  def create
    @note = SingleOrderNote.new(note_params)
    authorize @note
    @note.user = current_user
    @note.single_order = @single_order

    if @note.save
      redirect_to single_order_path(@single_order)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(note_params)
      redirect_to(@note)
    else
      render edit
    end
  end

  def destroy
    @note.destroy
    redirect_to single_order_path(@single_order)
  end

  private

  def note_params
    params.require(:single_order_note).permit(:description)
  end

  def set_note
    @note = SingleOrderNote.find(params[:id])
    authorize @note
  end

  def set_single_order
    @single_order = SingleOrder.find(params[:single_order_id])
  end
end
