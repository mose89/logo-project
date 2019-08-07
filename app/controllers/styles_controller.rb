class StylesController < ApplicationController
  before_action :set_style, only: [:show, :edit, :update, :destroy]

  def new
    @style =Style.new
    authorize @style
  end

  def create
    @style = Style.new(style_params)
    authorize @style
    if @style.save
      redirect_to admins_style_path
    else
      render new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @style.update_attributes(style_params)
      redirect_to admins_style_path
    else
      render edit
    end
  end

  def index
    @styles = policy_scope(Style)
  end

  def destroy
    @style.destroy

    redirect_to admins_style_path
  end

  private

  def style_params
    params.require(:style).permit(:name, :price, :image, :image_cache)
  end

  def set_style
    @style = Style.find(params[:id])
    authorize @style
  end
end
