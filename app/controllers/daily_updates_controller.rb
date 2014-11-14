class DailyUpdatesController < ApplicationController
  before_action :set_daily_update, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html
  def index
    @daily_updates = DailyUpdate.all
    respond_with(@daily_updates)
  end

  def show
    respond_with(@daily_update)
  end

  def new
    @daily_update = DailyUpdate.new
    respond_with(@daily_update)
  end

  def edit
  end

  def create
    @daily_update = DailyUpdate.new(daily_update_params)
    @daily_update.save
    respond_with(@daily_update)
  end

  def update
    @daily_update.update(daily_update_params)
    respond_with(@daily_update)
  end

  def destroy
    @daily_update.destroy
    respond_with(@daily_update)
  end

  private
    def set_daily_update
      @daily_update = DailyUpdate.find(params[:id])
    end

    def daily_update_params
      params.require(:daily_update).permit(:business, :contact_person, :number, :designation, :status, :summary, :address, :email)
    end
end
