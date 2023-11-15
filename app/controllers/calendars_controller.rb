class CalendarsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_photo, only: [:edit, :update, :destroy]
  before_action :move_to_index, except: :index

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
    if current_user.if != @calendar.user_id
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
    if current_user.id == @calendar.user_id
      @calendar.destroy
    end
    redirect_to action: :index
  end

  private

  def calendar_params
    params.require(:calendar).permit(:start_time, :event).merge(user_id: current_user.id)
  end

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
