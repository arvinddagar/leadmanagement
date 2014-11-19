class Admin::ManageUserController < ApplicationController
	
	before_filter :check_user

    def check_user
  	  redirect_to daily_updates_path if !current_user.admin?
    end

	def index
		@user = User.all.where(:admin => nil)
	end


    def create
      build_resource(sign_up_params)
      if resource.save
        redirect_to admin_editors_path
      else
        clean_up_passwords resource
        respond_with resource
      end
    end

    def deactivate
 	 	@user = User.find(params[:id])
 	 	if @user.active
 	 	    @user.active = false

 	 	#     	respond_to do |format|
    #   format.html
    #   format.json { render json: @category_wise_data }
    # end


 	 	    respond_to do |format|
 	 	    	format.json {render json: "user deactivated"}
 	 	    end
 	 	else
 	 		@user.active = true
 	 		respond_to do |format|
 	 	    	format.json  {render json: "user activated"}
 	 	    end
 	 	end
 	 	@user.save
    end

	def new
		@user = User.new
	end

	def edit
		
	end

	
end
