class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    authorize @service
    if @service.save
      redirect_to(@service)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to(@service)
    else
      render edit
    end
  end

  def show
  end

  def index
    @services = policy_scope(Service)
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:name)
  end

  def set_service
    @service = Service.find(params[:id])
    authorize @service
  end
end
