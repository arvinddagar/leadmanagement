class DailyUpdatesController < ApplicationController
  before_action :set_daily_update, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @user=User.all
    @category=Category.all
    @search = DailyUpdate.search(params[:q])
    # if params[:q].nil?
    #   @daily_updates = @search.result.where(:status=>"0").includes(:lead_status).where('lead_statuses.state !=?', 'Client').references(:lead_status).order('daily_updates.created_at DESC').page(params[:page]).per(25)
    # else
      @daily_updates = @search.result.order('created_at DESC').page(params[:page]).per(25)
    # end
    respond_with(@daily_updates)
  end

  def show
    @lead_status = @daily_update.lead_status
    respond_with(@daily_update)
  end

  def schedule_meeting
    binding.pry
    @schedule=ScheduleMeeting.new(:meeting_date=>params[:meeting_date],:notes=>params[:notes],:assigned_to=>params[:assigned_to],:meeting_time=>params[:meeting_time],:venue=>params[:venue],:daily_update_id=>params[:daily_update_id])
    @schedule.save
    redirect_to :back
  end

  def new
    @category=Category.all
    @daily_update = DailyUpdate.new
    @daily_update.lead_status.build 
    respond_with(@daily_update)
  end

  def edit
     @category=Category.all
   @lead_status = @daily_update.lead_status
  end

  def create
    @daily_update = DailyUpdate.new(daily_update_params)
    if @daily_update.save
      flash[:notice] = "Update successfully created"
      redirect_to new_daily_update_path
    else
      render :new
    end
  end

  def update  
    @daily_update.update(daily_update_params)
    if  params[:daily_update][:lead_status_attributes]["0"][:state].nil? or  params[:daily_update][:lead_status_attributes]["0"][:comment].nil?
    else
       @daily_update.update(:status=>1)
    end
    redirect_to edit_daily_update_path(@daily_update)
  end

  def destroy
    @daily_update.destroy
    respond_with(@daily_update)
  end

  def scheduled_call
    @records=DailyUpdate.all
  end

  def call
    @call=LeadStatus.create(:state=>params[:state],:daily_update_id=>params[:daily_update_id],:comment=>params[:comment],:schedule_next_call=>params[:schedule_next_call],:schedule_next_call_time=>params[:schedule_next_call_time])
    redirect_to :back
  end

  def fetch_daily
    @d=ScheduleMeeting.find(params[:daily_up]).daily_update_id
    render :json =>@d
  end

  private
    def set_daily_update
      @daily_update = DailyUpdate.find(params[:id])
    end

    def daily_update_params
      params.require(:daily_update).permit(:business,:status, :category_id,:contact_person,:user_id, :number, :designation, :status, :summary, :address, :email,lead_status_attributes: [:state,
                                                   :comment,:user_id,:schedule_next_call,:schedule_next_call_time])
    end
end
