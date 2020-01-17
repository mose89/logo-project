class GalleriesController < ApplicationController
before_action :find_gallery, only: [:show, :edit, :update, :destroy]

  def new
    @gallery = Gallery.new
    authorize @gallery
  end

  def create
    @gallery = Gallery.new(gallery_params)
    authorize @gallery
    if @gallery.save!
      redirect_to admins_gallery_path
    else
      render index
    end
  end

  def edit
  end

  def update
    if @gallery.update_attributes(gallery_params)
      redirect_to admins_gallery_path
    else
      render edit
    end
  end

  def index
    @galleries = policy_scope(Gallery)
  end

  def destroy
    @gallery.destroy
    redirect_to galleries_path
  end

  private
  def gallery_params
    params.require(:gallery).permit(:header, :description, :photo, :photo_cache)
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
    authorize @gallery
  end

end
