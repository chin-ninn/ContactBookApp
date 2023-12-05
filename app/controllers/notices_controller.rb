class NoticesController < ApplicationController
  #before_action :authenticate_admin!, except: [:index, :show]
  #before_action :authenticate_user!, except: [:index, :show]
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  #before_action :move_to_index, except: :index

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
  end

  def edit
    if current_admin.if != @notice.admin_id
      redirect_to action: :index
    end
  end

  def update
    @notice.update(notice_params)
    if @notice.save
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    if current_admin.id == @notice.admin_id
      @notice.destroy
    end
    redirect_to action: :index
  end

  private

  def notice_params
    params.require(:notice).permit(:notice_title, :notice_text).merge(admin_id: current_user.id)
  end

  def set_notice
    @notice = Notice.find(params[:id])
  end

  def move_to_index
    unless admin_signed_in?
      redirect_to action: :index
    end
  end
end
