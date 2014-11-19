class Admin::UsersController < ApplicationController

	before_filter :check_user

    def check_user
    	redirect_to daily_updates_path if !current_user.admin?
    end

	def create
		@user = User.new(user_params)
		@user.active = true
		@user.save
		redirect_to admin_manage_user_index_path
	end

	def user_params
		params.require(:user).permit!		
	end

end
