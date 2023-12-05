class CalendarsController < ApplicationController
  #before_action :authenticate_admin!, except: :index
  #before_action :authenticate_user!, except: :index
  before_action :set_photo, only: [:edit, :update, :destroy]
  #before_action :move_to_index, except: :index

  def index
    @calendars = Calendar.all
    @calendar = Calendar.new
  end

  def new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  def edit
    if current_admin.if != @calendar.admin_id
      redirect_to action: :index
    end
  end

  def update
    @calendar.update(calendar_params)
    if @calendar.save
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    if current_admin.id == @calendar.admin_id
      @calendar.destroy
    end
    redirect_to action: :index
  end

  private

  def calendar_params
    params.require(:calendar).permit(:start_time, :event).merge(admin_id: current_admin.id)
  end

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def move_to_index
    unless admin_signed_in?
      redirect_to action: :index
    end
  end
end
