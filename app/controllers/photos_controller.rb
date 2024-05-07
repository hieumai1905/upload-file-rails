# app/controllers/photos_controller.rb

class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    uploaded_files = Array.wrap(params[:photo][:url]).reject(&:blank?)

    @photos = uploaded_files.map do |url|
      Photo.new(url: url)
    end

    if @photos.all?(&:valid?)
      @photos.each(&:save!)
      flash[:success] = 'Files uploaded successfully'
      redirect_to root_path
    else
      @photo = Photo.new
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(url: [])
  end
end
