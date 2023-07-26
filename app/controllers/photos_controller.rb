class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
  
    def index
      @photos = Photo.all
    end
  
    def new
      @photo = Photo.new
    end
  
    def create
      @photo = current_user.photos.build(photo_params)
      if @photo.save
        redirect_to root_path, notice: 'Foto subida exitosamente'
      else
        render :new
      end
    end
  
    def show
      @photo = Photo.find(params[:id])
    end
  
    private
  
    def photo_params
      params.require(:photo).permit(:image, :description)
    end
  end