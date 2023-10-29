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
    @photo = Photo.find(params[:id])
    #if current_user.if != @photo.user_id
      #redirect_to action: :index
    #end
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    
    if @photo.save
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    #if current_user.id == @photo.user_id
    @photo.destroy
    #end
    redirect_to action: :index
  end

  private

  def photo_params
    params.require(:photo).permit(:photo_text)#.merge(user_id: current_user.id)
    #active strage実装後:imageをPermitに追加する
  end
end
