class ApplicationController < ActionController::Base
  def home
    @photos = Photo.all
    render "shared/home"
  end
end
