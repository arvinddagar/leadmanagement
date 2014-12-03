class Admin::DailyUpdatesController < ApplicationController
  before_filter :check_user, :except => [:schedule_meeting]
  
  def check_user
  	redirect_to daily_updates_path if !current_user.admin?
  end
  def index
  	@daily_updates = DailyUpdate.order("created_at").page(params[:page]).per(25)    
  end
  def user_daily_updates  	
  	@daily_updates=User.find(params[:id]).daily_updates.order("created_at").page(params[:page]).per(25)
  end
  def schedule_meeting
  	@schedule=ScheduleMeeting.new(:meeting_date=>params[:meeting_date],:notes=>params[:notes],:assigned_to=>params[:assigned_to],:meeting_time=>params[:meeting_time],:venue=>params[:venue],:daily_update_id=>params[:daily_update_id])
    @schedule.save
    redirect_to :back
  end
  def meetings
    @meetings= ScheduleMeeting.where(:meeting_date=>Date.today.to_s)
  end
end
