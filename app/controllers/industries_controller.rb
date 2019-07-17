class IndustriesController < ApplicationController
  before_action :set_industry, only: [:show, :edit, :update, :destroy]

  def new
    @industry =Industry.new
  end

  def create
    @industry = Industry.new(industry_params)

    if @industry.save
      redirect_to(@industry)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @industry.update(industry_params)
      redirect_to(@industry)
    else
      render edit
    end
  end

  def show
  end

  def index
    @industries = Industry.all
  end

  def destroy
    @industry.destroy
    redirect_to industries_path
  end

  private

  def industry_params
    params.require(:industry).permit(:name, :description, :price)
  end

  def set_industry
    @industry = Industry.find(params[:id])
  end
end
