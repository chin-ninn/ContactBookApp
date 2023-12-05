class PhotosController < ApplicationController
  #before_action :authenticate_admin!, except: [:index]
  #before_action :authenticate_user!, except: [:index]
  before_action :set_photo, only: [:edit, :update, :destroy]
  #before_action :move_to_index

  def index
    @photos = Photo.all.order(created_at: "DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    
    if @photo.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    
  end

  def edit
    if current_admin.if != @photo.admin_id
      redirect_to action: :index
    end
  end

  def update
    @photo.update(photo_params)
    if @photo.save
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    if current_admin.id == @photo.admin_id
      @photo.destroy
    end
    redirect_to action: :index
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_text, {images: []}).merge(admin_id: current_admin.id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def move_to_index
    unless admin_signed_in?
      redirect_to 'notices/index'
    end
  end
end
