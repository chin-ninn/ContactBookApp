class PhotosController < ApplicationController

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
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_text)#.merge(user_id: current_user.id)
  end
end
