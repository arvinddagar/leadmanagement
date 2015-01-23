class Admin::DailyUpdatesController < ApplicationController
  before_filter :check_user, :only => [:index,:user_daily_updates]
  respond_to :html
  
  def check_user
  	redirect_to daily_updates_path if current_user.role !="Admin" or !current_user.admin?
  end

  def index    
    @user=User.all
    @category=Category.all
    @search = DailyUpdate.search(params[:q])
    if params[:q].nil?
       @daily_updates = @search.result.where(:status=>"0").order('created_at DESC').page(params[:page]).per(25)
    else
      @daily_updates = @search.result.order('created_at DESC').page(params[:page]).per(25)
    end
    respond_with(@daily_updates)
  end
  
  def user_daily_updates
  	@daily_updates=User.find(params[:id]).daily_updates.order("created_at").page(params[:page]).per(25)
  end
  
  def fetch_meetings
    @meetings=ScheduleMeeting.find(params[:meeting_id])
    render :json =>@meetings
  end

  def notify_expiry
    @user=DailyUpdate.find(params[:id])
    NotificationMailer.expiry_notification(@user,params[:contract_id]).deliver
    redirect_to :back
  end
  
  def meetings
    @m=[]
    @user=User.all
    @meetings=[]
    @search = DailyUpdate.search(params[:q])
    @search.result.each do |daily|
      if daily.schedule_meeting.present?
        if @meetings.include?(daily.schedule_meeting.last.id )
        else
          @meetings<<daily.schedule_meeting.last.id
        end
        daily.schedule_meeting.each do |sm|
          if sm.meeting_date.present?
            if sm.mom==nil and sm.meeting_date<Date.today 
              if @m.include?(sm )
              else
                @m<<sm
              end
            end
          end
        end
      end
    end
  end
  
  def edit_meetings
    @user=User.all
    @meeting=ScheduleMeeting.find(params[:id])
  end

  def update_meetings
    if params[:commit]=="Save Only Mom"
      @meeting=ScheduleMeeting.find(params[:ss_id])
      @meeting.update(:mom=>params[:mom])
    elsif params[:commit]=="Submit"
	    @meeting=ScheduleMeeting.find(params[:s_id])
      @meeting.update(:meeting_date=>params[:meeting_date],:meeting_time=>params[:meeting_time],:venue=>params[:venue],:notes=>params[:notes]) 
    else
      @meeting=ScheduleMeeting.find(params[:ss_id])
      @meeting.update(:mom=>params[:mom])
      meeting_no= ScheduleMeeting.connection.execute("SELECT nextval('meeting_num_seq')")
      meeting='SE'+'0'+meeting_no[0]['nextval']
      @schedule=ScheduleMeeting.new(:meeting_no=>meeting,:meeting_date=>params[:meeting_date],:notes=>params[:notes],:assigned_to=>params[:assigned_to],:meeting_time=>params[:meeting_time],:venue=>params[:venue],:daily_update_id=>params[:daily_update_id])
      @schedule.save
    end
    redirect_to meetings_path
  end

  def client_management
    @user=User.all
    @search = DailyUpdate.search(params[:q])
    @daily_updates = @search.result
    respond_with(@daily_updates)
  end

  def new_contract
    @add_contract=AddContract.new
    @client=DailyUpdate.includes(:lead_status).where('lead_statuses.state =?', 'Client').references(:lead_status)
  end

  def show_meetings
    @meeting=ScheduleMeeting.find(params[:id])
  end

  def create_contract
    @add_contract=AddContract.create(:priority=>params[:priority],:daily_update_id=>params[:client_id],:status=>params[:status],:domain_name=>params[:domain_name],:work_status=>params[:work_status])
    @plan=Plan.create(:plan_type=>params[:plan],:renewal_date=>params[:renewal_date],:add_contract_id=>@add_contract.id)
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
   render :json =>@renewal_date
  end

  def index_contract
    @client=DailyUpdate.includes(:lead_status).where('lead_statuses.state =?', 'Client').references(:lead_status)
    @search = AddContract.search(params[:q])
    @contracts=@search.result
    respond_with(@contracts)
  end

  def edit_contract
    @contract=AddContract.find(params[:contract_id])
    @plans=Plan.where(:add_contract_id=>params[:id])
    @client=DailyUpdate.includes(:lead_status).where('lead_statuses.state =?', 'Client').references(:lead_status)
  end

  def fetch_contract
    @contract=AddContract.find(params[:contract])
    @plan=Plan.where(:add_contract_id=>@contract).last
    render :json => {:contract => @contract, :plan => @plan }
  end
  
  def update_contract
    @contract=AddContract.find(params[:contract_id])
    @contract.update(:priority=>params[:priority],:daily_update_id=>params[:client_id],:work_status=>params[:work_status],:status=>params[:status],:domain_name=>params[:domain_name])
    @plan=Plan.create(:plan_type=>params[:plan],:renewal_date=>params[:renewal_date],:add_contract_id=>params[:contract_id])
    redirect_to :index_contract
  end

  def payment_history
    @payment_history=PaymentHistory.where(:add_contract_id=>params[:id]).order("created_at DESC")
  end

  def create_payment
    @payment=PaymentHistory.create(:collection_date=>params[:collection_date],:amount=>params[:amount],:cheque_no=>params[:cheque_no],:bank_name=>params[:bank_name],:cheque_date=>params[:cheque_date],:transaction_type=>params[:transaction_type],:add_contract_id=>params[:add_contract_id])
    redirect_to :back
  end
  
  def reports
    @search = PaymentHistory.search(params[:q])
    @payments=@search.result.order("collection_date DESC")
    @payment=0
      @search.result.each do |pay|
        @payment=@payment+ pay.amount
      end
  end

  def contract_expiry
    @contract=AddContract.where(:status=>"expired")
    @c=[]
    @expiry_date=params[:expiry_date]
    AddContract.all.each do |c|
      if request.method=='POST'
        @con= (Date.today..Date.today+params[:expiry_date].to_i).cover?(c.plans.last.renewal_date)
      else
        @con= (Date.today..Date.today+7).cover?(c.plans.last.renewal_date)
      end
      if @con==true
        @c<<c
      end
    end
  end
  
  def daily_report
    @user=User.all
    @leads=[]
    @no_of_leads=0
    @no_of_calls=0
    @sm=[]
    @search = LeadStatus.search(params[:q])  
    if params[:q].blank?
      @search.result.each do |lead|
        if lead.created_at.to_date==Date.today
          @leads<<lead
          @no_of_calls=@no_of_calls+1
          if lead.state=="Interested"
            @no_of_leads=@no_of_leads+1
          end
        end
      end
    else
      @search.result.each do |lead|
        @leads<<lead
        @no_of_calls=@no_of_calls+1
        if lead.state=="Interested"
          @no_of_leads=@no_of_leads+1
        end
      end
    end  
    respond_with(@leads) 
    ScheduleMeeting.all.each do |sm|
      if sm.created_at.to_date==Date.today
        @sm<<sm
      end
    end
  end

  def past_clients
    @past_clients=DailyUpdate.all
  end
  def not_called
    @category=Category.all
    @user=User.all
    @search = DailyUpdate.search(params[:q])
    @not_called= @search.result.where(:status=>'0').order('created_at DESC').page(params[:page]).per(25 )
    respond_with(@not_called)
  end
end
