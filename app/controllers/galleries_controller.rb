class GalleriesController < ApplicationController

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save!
      redirect_to galleries_path
    else
      render "index"
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def index
    @galleries = Gallery.all
  end

  private
  def gallery_params
    params.require(:gallery).permit(:header, :description, :photo, :photo_cached)
  end

end
