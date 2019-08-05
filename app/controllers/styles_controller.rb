class StylesController < ApplicationController
  before_action :set_style, only: [:show, :edit, :update :destroy]

  def new
    @style =Style.new
    authorize @style
  end

  def create
    @style = Style.new(style_params)
    authorize @style
    if @style.save
      redirect_to(@style)
    else
      render new
    end
  end


  def show
  end

  def index
    @styles = policy_scope(Style)
  end

  def destroy
    @style.destroy

    redirect_to styles_path
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
