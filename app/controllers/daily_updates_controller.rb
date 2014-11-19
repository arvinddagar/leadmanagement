class DailyUpdatesController < ApplicationController
  before_action :set_daily_update, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html
  def index
    @daily_updates = DailyUpdate.all
    respond_with(@daily_updates)
  end

  def show
    @lead_status = @daily_update.lead_status
    respond_with(@daily_update)
  end

  def new
    @daily_update = DailyUpdate.new
    @daily_update.lead_status.build 
    respond_with(@daily_update)
  end

  def edit
   @lead_status = @daily_update.lead_status
  end

  def create
    @daily_update = DailyUpdate.new(daily_update_params)
    if @daily_update.save
      flash[:notice] = "Update successfully created"
      redirect_to new_daily_update_path
    else
      flash[:alert] = "Error!"
      redirect_to new_daily_update_path
    end
  end

  def update
    @daily_update.update(daily_update_params)
    #respond_with(@daily_update)
    redirect_to edit_daily_update_path(@daily_update)
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
      params.require(:daily_update).permit(:business, :contact_person, :number, :designation, :status, :summary, :address, :email,lead_status_attributes: [:state,
                                                   :comment,:user_id])
    end
end
