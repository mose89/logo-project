class StylesController < ApplicationController
  before_action :set_style, only: [:show, :destroy]

  def new
    @style =Style.new
  end

  def create
    @style = Style.new(style_params)

    if @style.save
      redirect_to(@style)
    else
      render new
    end
  end


  def show
  end

  def index
    @styles = Style.all
  end

  def destroy
    @style.destroy

    redirect_to styles_path
  end

  private

  def style_params
    params.require(:style).permit(:name, :price)
  end

  def set_style
    @style = Style.find(params[:id])
  end
end
