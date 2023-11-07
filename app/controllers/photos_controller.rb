class PhotosController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_photo, only: [:edit, :update, :destroy]
  #before_action :move_to_index, except: :index

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
    #if current_user.if != @photo.user_id
      #redirect_to action: :index
    #end
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
    #if current_user.id == @photo.user_id
    @photo.destroy
    #end
    redirect_to action: :index
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :photo_text)#.merge(user_id: current_user.id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
