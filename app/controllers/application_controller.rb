class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 def after_sign_in_path_for(resource)
    if resource.admin? 
       daily_updates_path
    else
       new_daily_update_path
    end
 end

end
