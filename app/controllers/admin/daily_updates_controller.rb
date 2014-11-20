class Admin::DailyUpdatesController < ApplicationController
  before_filter :check_user

  def check_user
  	redirect_to daily_updates_path if !current_user.admin?
  end
  def index
  	@daily_updates = DailyUpdate.order("created_at DESC").page(params[:page]).per(5)    
  end

end
