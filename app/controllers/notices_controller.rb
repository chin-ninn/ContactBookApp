class NoticesController < ApplicationController
  def index
    @notices = Notice.all.order(created_at: "DESC")
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    
    if @notice.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def edit
    @notice = Notice.find(params[:id])
    #if current_user.if != @notice.user_id
      #redirect_to action: :index
    #end
  end

  def update
    @notice = Notice.find(params[:id])
    @notice.update(notice_params)
    
    if @notice.save
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    #if current_user.id == @notice.user_id
    @notice.destroy
    #end
    redirect_to action: :index
  end

  private

  def notice_params
    params.require(:notice).permit(:notice_title, :notice_text)#.merge(user_id: current_user.id)
  end
end
