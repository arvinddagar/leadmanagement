class Admin::ManageUserController < ApplicationController
	before_filter :check_user

  def check_user
    redirect_to daily_updates_path if !current_user.admin?
  end

	def index
		@user = User.all.where(:admin => nil)
	end

  def deactivate
 	  @user = User.find(params[:id])
 	  if @user.active
 	    @user.active = false
 	    @user.save
 	    respond_to do |format|
 	     	format.json {render json: "user deactivated"}
 	    end
 	  else
 	  	@user.active = true
 	  	@user.save
 	  	respond_to do |format|
 	     	format.json  {render json: "user activated"}
 	    end
 	  end
  end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end	
end