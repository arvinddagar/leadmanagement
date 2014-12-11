class Admin::DailyUpdatesController < ApplicationController
  before_filter :check_user, :only => [:index,:user_daily_updates]
  respond_to :html
  
  def check_user
  	redirect_to daily_updates_path if current_user.role !="Admin" or !current_user.admin?
  end

  def index
  	@search = DailyUpdate.search(params[:q])
    @daily_updates = @search.result.order("created_at DESC").page(params[:page]).per(25)
    respond_with(@daily_updates)    
  end
  def user_daily_updates  	
  	@daily_updates=User.find(params[:id]).daily_updates.order("created_at").page(params[:page]).per(25)
  end  
  def meetings
    @search = ScheduleMeeting.search(params[:q])
    if current_user.admin== true or current_user.role=="Manager" or current_user=="Admin"
      @meetings=@search.result
    else
      @meetings=@search.result.where(:assigned_to=>current_user.id)
    end
    respond_with(@meetings)
  end
  def edit_meetings
    @meeting=ScheduleMeeting.find(params[:id])
  end
  def update_meetings
    @meeting=ScheduleMeeting.find(params[:id])
    @meeting.update(:mom=>params[:mom])
    redirect_to :back
  end
   def client_management
    @search = DailyUpdate.search(params[:q])
    @daily_updates = DailyUpdate.includes(:lead_status).where('lead_statuses.state =?', 'Client').references(:lead_status).page(params[:page]).per(25)
    respond_with(@daily_updates)    
    
  end
  def new_contract
    @add_contract=AddContract.new

  end
  def create_contract
    @add_contract=AddContract.create(:client_id=>params[:client_id],:client_name=>params[:client_name],:renewal_date=>params[:renewal_date],:plan=>params[:plan],:status=>params[:status],:domain_name=>params[:domain_name])
    redirect_to :back
  end
def fetch_plans
 
  if params[:plans]=="1 month"
  @renewal_date=  Time.now + 1.month
  elsif params[:plans]=="2 month"
    @renewal_date=  Time.now + 2.month
  elsif params[:plans]=="quaterly"
    @renewal_date=  Time.now + 3.month
    elsif params[:plans]=="half yearly"
    @renewal_date=  Time.now + 6.month
     else params[:plans]=="yearly"
    @renewal_date=  Time.now + 12.month   
  end
   render :json =>@renewal_date.strftime("%d-%m-%Y")
end
def index_contract
  @contracts=AddContract.all
end
def edit_contract
  @contract=AddContract.find(params[:id])
  end
  def update_contract
   
  @contract=AddContract.find(params[:id])
  @contract.update(:client_id=>params[:client_id],:client_name=>params[:client_name],:renewal_date=>params[:renewal_date],:plan=>params[:plan],:status=>params[:status],:domain_name=>params[:domain_name])
  redirect_to :index_contract
  end
end
