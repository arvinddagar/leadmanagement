class Admin::DailyUpdatesController < ApplicationController
  before_filter :check_user

  def check_user
  	redirect_to daily_updates_path if !current_user.admin?
  end
  def index
  	@daily_updates = DailyUpdate.order("updated_at").page(params[:page]).per(25)    
  end

end
